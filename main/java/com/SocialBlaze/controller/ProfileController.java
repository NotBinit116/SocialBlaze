package com.SocialBlaze.controller;

import com.SocialBlaze.model.UserModel;
import com.SocialBlaze.service.ProfileService;
import com.SocialBlaze.util.ImageUtil;
import com.SocialBlaze.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

@WebServlet(urlPatterns = { "/profile" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final ProfileService profileService = new ProfileService();
    private final ImageUtil imageUtil = new ImageUtil();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get current logged-in user
        UserModel loggedInUser = (UserModel) SessionUtil.getAttribute(request, "loggedInUser");

        if (loggedInUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Fetch fresh user data from DB
        UserModel userFromDb = profileService.getUserByUsername(loggedInUser.getUsername());

        // Send to JSP
        request.setAttribute("user", userFromDb);
        request.getRequestDispatcher("WEB-INF/pages/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserModel loggedInUser = (UserModel) SessionUtil.getAttribute(request, "loggedInUser");

        if (loggedInUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String username = request.getParameter("username");
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Basic validation
        if (username == null || fullName == null || email == null ||
            username.isEmpty() || fullName.isEmpty() || email.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/profile?error=Please+fill+in+all+required+fields");
            return;
        }

        // Handle image upload
        Part filePart = request.getPart("profileImage");
        if (filePart != null && filePart.getSize() > 0) {
            String imageName = imageUtil.getImageNameFromPart(filePart);
            boolean uploaded = imageUtil.uploadImage(filePart, "", "uploads"); // 'rootPath' unused

            if (uploaded) {
                loggedInUser.setImageUrl(imageName);
                SessionUtil.setAttribute(request, "profileImage", imageName);
            } else {
                System.out.println("Image upload failed.");
            }
        }

        // Update fields
        loggedInUser.setUsername(username);
        loggedInUser.setFullName(fullName);
        loggedInUser.setEmail(email);

        // Only update password if it's not empty
        if (password != null && !password.trim().isEmpty()) {
            loggedInUser.setPassword(password);
        }

        // Save to database
        boolean isUpdated = profileService.updateUserProfile(loggedInUser);

        if (isUpdated) {
            SessionUtil.setAttribute(request, "loggedInUser", loggedInUser);
            response.sendRedirect(request.getContextPath() + "/profile?success=Profile+updated+successfully");
        } else {
            response.sendRedirect(request.getContextPath() + "/profile?error=Failed+to+update+profile");
        }
    }
}
