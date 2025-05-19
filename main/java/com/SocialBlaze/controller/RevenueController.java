package com.SocialBlaze.controller;

import com.SocialBlaze.model.RevenueModel;
import com.SocialBlaze.model.UserModel;
import com.SocialBlaze.service.RevenueService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = { "/revenue" })
public class RevenueController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Get the logged-in user from session
        UserModel user = (UserModel) request.getSession().getAttribute("loggedInUser");

        if (user == null) {
            // If no user in session, redirect to login
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = user.getUserId(); // Extract user ID from session

        RevenueService revenueService = new RevenueService();
        List<RevenueModel> revenueList = revenueService.getAllRevenueForUser(userId);

        request.setAttribute("revenueList", revenueList);
        request.getRequestDispatcher("/WEB-INF/pages/revenue.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
