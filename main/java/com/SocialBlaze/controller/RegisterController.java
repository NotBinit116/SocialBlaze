package com.SocialBlaze.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.sql.Timestamp;

import com.SocialBlaze.model.UserModel;
import com.SocialBlaze.service.LoginService;
import com.SocialBlaze.service.RegisterService;
import com.SocialBlaze.util.ImageUtil;
import com.SocialBlaze.util.PasswordUtil;
import com.SocialBlaze.util.RedirectionUtil;
import com.SocialBlaze.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 15
)
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final ValidationUtil validationUtil = new ValidationUtil();
    private final RedirectionUtil redirectionUtil = new RedirectionUtil();
    private final RegisterService registerService = new RegisterService();
    private final LoginService loginService = new LoginService();
    private final ImageUtil imageUtil = new ImageUtil();

    private final String registerPage = "/WEB-INF/pages/register.jsp";
    private final String loginPage = "/WEB-INF/pages/login.jsp";
    private final String uploadFolder = "uploads"; // maps to /resources/uploads

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
        Part profileImagePart = req.getPart("profileImage");

        if (validationUtil.isNullOrEmpty(username) || validationUtil.isNullOrEmpty(password) ||
            validationUtil.isNullOrEmpty(fullName) || validationUtil.isNullOrEmpty(email)) {
            redirectionUtil.setMsgAndRedirect(req, resp, "error", "Please fill all required fields!", registerPage);
            return;
        }

        String imageFileName = null;

        if (profileImagePart != null && profileImagePart.getSize() > 0) {
            String originalFileName = imageUtil.getImageNameFromPart(profileImagePart);
            imageFileName = System.currentTimeMillis() + "_" + originalFileName;

            String uploadPath = imageUtil.getSavePath(uploadFolder);
            File saveDir = new File(uploadPath);
            if (!saveDir.exists()) saveDir.mkdirs();

            File imageFile = new File(saveDir, imageFileName);
            try (InputStream input = profileImagePart.getInputStream()) {
                Files.copy(input, imageFile.toPath());
            } catch (IOException e) {
                e.printStackTrace();
                redirectionUtil.setMsgAndRedirect(req, resp, "error", "Image upload failed!", registerPage);
                return;
            }
        }

        Timestamp now = new Timestamp(System.currentTimeMillis());

        UserModel userModel = new UserModel();
        userModel.setUsername(username);
        userModel.setPassword(PasswordUtil.encrypt(username, password));
        userModel.setFullName(fullName);
        userModel.setEmail(email);
        userModel.setRoleId(2);
        userModel.setRegistrationDate(now);
        userModel.setLastLoginDate(now);
        userModel.setImageUrl(imageFileName);

        UserModel existingUser = loginService.loginUser(userModel);
        if (existingUser != null) {
            redirectionUtil.setMsgAndRedirect(req, resp, "error", "Username already taken!", registerPage);
            return;
        }

        Boolean isRegistered = registerService.registerUser(userModel);
        if (isRegistered != null && isRegistered) {
            req.getSession().setAttribute("username", username);
            redirectionUtil.setMsgAndRedirect(req, resp, "success", "Registration successful!", loginPage);
        } else {
            redirectionUtil.setMsgAndRedirect(req, resp, "error", "Registration failed, please try again!", registerPage);
        }
    }
}
