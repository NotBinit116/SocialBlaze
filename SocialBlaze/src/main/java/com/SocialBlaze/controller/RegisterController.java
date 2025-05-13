package com.SocialBlaze.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.SocialBlaze.model.UserModel;
import com.SocialBlaze.service.LoginService;
import com.SocialBlaze.service.RegisterService;
import com.SocialBlaze.util.PasswordUtil;
import com.SocialBlaze.util.RedirectionUtil;
import com.SocialBlaze.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ValidationUtil validationUtil;
    private RedirectionUtil redirectionUtil;
    private RegisterService registerService;
    private LoginService loginService;

    private final String registerPage = "/WEB-INF/pages/register.jsp";
    private final String homePage = "/WEB-INF/pages/home.jsp";

    public RegisterController() {
        this.validationUtil = new ValidationUtil();
        this.redirectionUtil = new RedirectionUtil();
        this.registerService = new RegisterService();
        this.loginService = new LoginService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(registerPage).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String phoneNumber = req.getParameter("phoneNumber");

        System.out.println("Registering - Username: [" + username + "], FullName: [" + fullName + "], Email: [" + email + "], Phone: [" + phoneNumber + "]");

        if (validationUtil.isNullOrEmpty(username) || validationUtil.isNullOrEmpty(password) ||
            validationUtil.isNullOrEmpty(fullName) || validationUtil.isNullOrEmpty(email)) {
            System.out.println("Validation failed: Missing required fields.");
            redirectionUtil.setMsgAndRedirect(req, resp, "error", "Please fill all required fields!", registerPage);
            return;
        }

        UserModel userModel = new UserModel();
        userModel.setUsername(username);
        userModel.setPassword(PasswordUtil.encrypt(username, password));
        userModel.setFullName(fullName);
        userModel.setEmail(email);
        userModel.setRoleId(2); // Default to 'user' role
        LocalDateTime now = LocalDateTime.now();
        userModel.setRegistrationDate(now);
        userModel.setLastLoginDate(now);

        // Check if user already exists
        UserModel existingUser = loginService.loginUser(userModel);
        if (existingUser != null) {
            System.out.println("Username already exists: " + username);
            redirectionUtil.setMsgAndRedirect(req, resp, "error", "Username already taken!", registerPage);
            return;
        }

        Boolean isRegistered = registerService.registerUser(userModel);
        if (isRegistered == null) {
            System.out.println("Registration failed: DB connection issue.");
            redirectionUtil.setMsgAndRedirect(req, resp, "error", "Something went wrong, please try again later!", registerPage);
        } else if (isRegistered) {
            System.out.println("Registration successful.");
            req.getSession().setAttribute("username", username);
            redirectionUtil.setMsgAndRedirect(req, resp, "success", "Registration successful!", homePage);
        } else {
            System.out.println("Registration failed: Unknown error.");
            redirectionUtil.setMsgAndRedirect(req, resp, "error", "Registration failed, please try again!", registerPage);
        }
    }
}
