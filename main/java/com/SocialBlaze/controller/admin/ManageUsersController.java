package com.SocialBlaze.controller.admin;

import com.SocialBlaze.model.ManageUsers;
import com.SocialBlaze.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/manageusers")
public class ManageUsersController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminService adminService;

    @Override
    public void init() {
        adminService = new AdminService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchQuery = request.getParameter("search");

        List<ManageUsers> usersList = (searchQuery != null && !searchQuery.trim().isEmpty())
            ? adminService.searchUsers(searchQuery)
            : adminService.getAllUsers();

        if (searchQuery != null) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            for (ManageUsers user : usersList) {
                out.println("<tr>");
                out.println("<td>" + user.getFullName() + "</td>");
                out.println("<td>" + user.getEmail() + "</td>");
                out.println("<td>" + user.getRole() + "</td>");
                out.println("<td>" + user.getRegistrationDate() + "</td>");
                out.println("<td>" + user.getAccountCount() + "</td>");
                out.println("<td>");
                out.println("<form method='post' action='manageusers' onsubmit='return confirm(\"Are you sure you want to delete this user?\");'>");
                out.println("<input type='hidden' name='action' value='delete'/>");
                out.println("<input type='hidden' name='userID' value='" + user.getUserID() + "'/>");
                out.println("<button type='submit' class='delete-btn'>Delete</button>");
                out.println("</form>");
                out.println("</td>");
                out.println("</tr>");
            }
            return;
        }

        request.setAttribute("usersList", usersList);
        request.getRequestDispatcher("WEB-INF/pages/admin/manageusers.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int userID = Integer.parseInt(request.getParameter("userID"));
            adminService.deleteUser(userID);
        }

        doGet(request, response);
    }
}
