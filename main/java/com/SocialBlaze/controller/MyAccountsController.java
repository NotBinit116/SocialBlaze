package com.SocialBlaze.controller;

import com.SocialBlaze.model.SocialAccount;
import com.SocialBlaze.service.MainService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(asyncSupported = true, urlPatterns = { "/myaccounts" })
public class MyAccountsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MainService mainService;

    public MyAccountsController() {
        super();
        mainService = new MainService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        
        int userId = (int) session.getAttribute("userID");

        List<SocialAccount> accounts = mainService.getSocialAccountsByUserId(userId);
        req.setAttribute("accounts", accounts);

        Map<Integer, String> platformIcons = new HashMap<>();
        platformIcons.put(1, "fab fa-facebook");
        platformIcons.put(2, "fab fa-instagram");
        platformIcons.put(3, "fab fa-twitter");
        platformIcons.put(4, "fab fa-youtube");
        req.setAttribute("platformIcons", platformIcons);

        Map<Integer, String> platformNames = new HashMap<>();
        platformNames.put(1, "Facebook");
        platformNames.put(2, "Instagram");
        platformNames.put(3, "Twitter");
        platformNames.put(4, "YouTube");
        req.setAttribute("platformNames", platformNames);

        req.getRequestDispatcher("/WEB-INF/pages/myaccounts.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (Integer) session.getAttribute("userID");

        // 1. Handle Delete
        String deleteAccountIdStr = request.getParameter("deleteAccountId");
        if (deleteAccountIdStr != null) {
            try {
                int deleteAccountId = Integer.parseInt(deleteAccountIdStr);
                boolean deleted = mainService.deleteSocialMediaAccount(deleteAccountId, userId);
                if (!deleted) {
                    request.setAttribute("error", "Failed to delete account.");
                    doGet(request, response);
                    return;
                }
                response.sendRedirect(request.getContextPath() + "/myaccounts");
                return;
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid account ID for deletion.");
                doGet(request, response);
                return;
            }
        }

        // 2. Handle Edit
        String editAccountIdStr = request.getParameter("editAccountId"); // <-- Updated to match JSP
        if (editAccountIdStr != null && !editAccountIdStr.isEmpty()) {
            try {
                int editAccountId = Integer.parseInt(editAccountIdStr);
                int platformId = Integer.parseInt(request.getParameter("platform"));
                String accountName = request.getParameter("accountName");
                String profileURL = request.getParameter("profileURL");

                if (accountName == null || accountName.trim().isEmpty() ||
                    profileURL == null || profileURL.trim().isEmpty()) {
                    request.setAttribute("error", "Account Name and Profile URL cannot be empty.");
                    doGet(request, response);
                    return;
                }

                boolean success = mainService.updateSocialMediaAccount(
                        editAccountId, userId, platformId, accountName, profileURL);

                if (!success) {
                    request.setAttribute("error", "Failed to update social account. Please try again.");
                }

            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid data for update.");
            }

            response.sendRedirect(request.getContextPath() + "/myaccounts");
            return;
        }

        // 3. Handle Add
        try {
            int platformId = Integer.parseInt(request.getParameter("platform"));
            String accountName = request.getParameter("accountName");
            String profileURL = request.getParameter("profileURL");

            if (accountName == null || accountName.trim().isEmpty() ||
                profileURL == null || profileURL.trim().isEmpty()) {
                request.setAttribute("error", "Account Name and Profile URL cannot be empty.");
                doGet(request, response);
                return;
            }

            boolean success = mainService.addSocialMediaAccount(userId, platformId, accountName, profileURL);

            if (!success) {
                request.setAttribute("error", "Failed to add social account. Please try again.");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid platform selected.");
        }

        response.sendRedirect(request.getContextPath() + "/myaccounts");
    }
}
