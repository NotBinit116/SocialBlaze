package com.socialblaze.controller;

import java.io.IOException;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;

import com.socialblaze.model.StudentModel;
import com.socialblaze.service.DashboardService;
import com.socialblaze.service.RegisterService;
import com.socialblaze.util.ImageUtil;
import com.socialblaze.util.PasswordUtil;
import com.socialblaze.util.RedirectionUtil;

/**
 * RegisterController handles user registration requests and processes form
 * submissions. It also manages file uploads and account creation.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/dashboard" })

public class DashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ImageUtil imageUtil;
	private DashboardService dashboardService;
	private RedirectionUtil redirectionUtil;

	@Override
	public void init() throws ServletException {
		this.dashboardService = new DashboardService();
		this.imageUtil = new ImageUtil();
		this.redirectionUtil = new RedirectionUtil();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("totalStudent", dashboardService.getTotalStudentCount());
		req.setAttribute("totalComputing", dashboardService.getCourseStudentCount("Computing"));
		req.setAttribute("totalMultimedia", dashboardService.getCourseStudentCount("Multimedia"));
		req.setAttribute("totalNetworking", dashboardService.getCourseStudentCount("Networking"));
		req.setAttribute("recentStudents", dashboardService.getRecentlyEnrolledStudents());
		
		redirectionUtil.redirectToPage(req, resp, RedirectionUtil.registerUrl);
	}

	
}