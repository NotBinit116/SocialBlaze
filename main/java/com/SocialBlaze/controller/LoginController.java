package com.SocialBlaze.controller;

import java.io.IOException;

import com.SocialBlaze.model.UserModel;
import com.SocialBlaze.service.LoginService;
import com.SocialBlaze.util.RedirectionUtil;
import com.SocialBlaze.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ValidationUtil validationUtil;
    private RedirectionUtil redirectionUtil;
    private LoginService loginService;

    private final String loginPage = "/WEB-INF/pages/login.jsp";
    private final String dashboardPage = "/WEB-INF/pages/dashboard.jsp";

    public LoginController() {
        this.validationUtil = new ValidationUtil();
        this.redirectionUtil = new RedirectionUtil();
        this.loginService = new LoginService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(loginPage).forward(req, resp);
    }
    

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        System.out.println("Login attempt - Username: [" + username + "], Password: [PROTECTED]");

        if (validationUtil.isNullOrEmpty(username) || validationUtil.isNullOrEmpty(password)) {
            System.out.println("Validation failed: Missing fields.");
            redirectionUtil.setMsgAndRedirect(req, resp, "error", "Please fill all the fields!", loginPage);
            return;
        }

        UserModel userModel = new UserModel();
        userModel.setUsername(username);
        userModel.setPassword(password);

        UserModel authenticatedUser = loginService.loginUser(userModel);
        

        if (authenticatedUser == null) {
            System.out.println("Login failed: Invalid credentials or DB error.");
            redirectionUtil.setMsgAndRedirect(req, resp, "error", "Either username or password is incorrect!", loginPage);
        } else {
            System.out.println("Login successful for userId: " + authenticatedUser.getUserId());
            System.out.println("Profile Image from DB: " + authenticatedUser.getImageUrl());

            // ✅ Store the full object in session for profile and other features
            req.getSession().setAttribute("loggedInUser", authenticatedUser);

            // Optionally still store these separately if needed elsewhere
            req.getSession().setAttribute("username", authenticatedUser.getUsername());
            req.getSession().setAttribute("userID", authenticatedUser.getUserId());
            req.getSession().setAttribute("profileImage", authenticatedUser.getImageUrl());

            // Redirect based on username
            if ("Admin".equalsIgnoreCase(authenticatedUser.getUsername())) {
                resp.sendRedirect(req.getContextPath() + "/admindashboard");
            } else {
                resp.sendRedirect(req.getContextPath() + "/dashboard");
            }
        }
}}
