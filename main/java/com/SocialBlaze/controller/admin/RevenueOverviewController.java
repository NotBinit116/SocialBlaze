package com.SocialBlaze.controller.admin;

import com.SocialBlaze.service.RevenueOverviewService;
import com.SocialBlaze.model.RevenueOverview;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/revenueoverview")
public class RevenueOverviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RevenueOverviewService service = new RevenueOverviewService();

		List<RevenueOverview> revenueList = service.getAllRevenueData();
		double totalRevenue = service.getTotalRevenue();
		int totalTransactions = service.getTotalTransactions();
		int paidTransactions = service.getPaidTransactions();
		int pendingTransactions = service.getPendingTransactions();

		request.setAttribute("revenueList", revenueList);
		request.setAttribute("totalRevenue", totalRevenue);
		request.setAttribute("totalTransactions", totalTransactions);
		request.setAttribute("paidTransactions", paidTransactions);
		request.setAttribute("pendingTransactions", pendingTransactions);

		request.getRequestDispatcher("WEB-INF/pages/admin/revenueoverview.jsp").forward(request, response);
	}
}
