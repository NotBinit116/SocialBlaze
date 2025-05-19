package com.SocialBlaze.controller;

import com.SocialBlaze.model.PostPerformances;
import com.SocialBlaze.service.PostPerformancesService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/postperformances"})
public class PostPerformancesController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PostPerformancesService service;

    public void init() {
        service = new PostPerformancesService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userID");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        

        PostPerformancesService service = new PostPerformancesService();
        List<PostPerformances> posts = service.getPostsByUserId(userId);

        request.setAttribute("postList", posts);
        request.getRequestDispatcher("WEB-INF/pages/postperformances.jsp").forward(request, response);
        
        System.out.println("Fetching posts for userID: " + userId);
        System.out.println("Posts fetched: " + posts.size());
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userID");
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String postLink = request.getParameter("postLink");
            String date = request.getParameter("date");
            int likes = Integer.parseInt(request.getParameter("likes"));
            int comments = Integer.parseInt(request.getParameter("comments"));
            int views = Integer.parseInt(request.getParameter("views"));
            int impressions = Integer.parseInt(request.getParameter("impressions"));

            service.addPost(userId, postLink, date, likes, comments, views, impressions);
        } else if ("delete".equals(action)) {
            int postId = Integer.parseInt(request.getParameter("postID"));
            service.deletePost(postId, userId);
        }

        response.sendRedirect("postperformances");
    }

}
