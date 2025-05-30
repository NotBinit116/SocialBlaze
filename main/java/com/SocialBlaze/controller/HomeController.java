
package com.SocialBlaze.controller;

import java.io.IOException;

import com.SocialBlaze.util.RedirectionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author 
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/home", "/" })
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher(RedirectionUtil.homeUrl).forward(req, resp);
	}

}
