package com.SocialBlaze.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import com.SocialBlaze.util.SessionUtil;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter(asyncSupported = true, urlPatterns = { "/*" })
public class AuthenticationFilter implements Filter {

    private static final String LOGIN = "/login";
    private static final String REGISTER = "/register";
    private static final String HOME = "/home";
    private static final String ROOT = "/";
    private static final String DASHBOARD = "/dashboard";

    private static final List<String> adminPages = Arrays.asList(
        "/admindashboard", "/revenueoverview", "/manageusers"
    );

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();

        // Allow static resources to pass through
        if (uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith(".png") || uri.endsWith(".jpg")) {
            chain.doFilter(request, response);
            return;
        }

        // Get session values
        String username = (String) SessionUtil.getAttribute(req, "username");
        boolean isLoggedIn = username != null;
        boolean isAdmin = "admin".equalsIgnoreCase(username);

        boolean isLoginOrRegister = uri.endsWith(LOGIN) || uri.endsWith(REGISTER);
        boolean isAdminPage = adminPages.stream().anyMatch(uri::endsWith);

        // Not logged in → allow login/register, redirect all others to /login
        if (!isLoggedIn) {
            if (isLoginOrRegister || uri.endsWith(HOME) || uri.endsWith(ROOT)) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(contextPath + LOGIN);
            }
            return;
        }

        // Logged in users trying to access login/register → redirect
        if (isLoginOrRegister) {
            if (isAdmin) {
                res.sendRedirect(contextPath + "/admindashboard");
            } else {
                res.sendRedirect(contextPath + DASHBOARD);
            }
            return;
        }

        // If normal user tries to access admin-only page → redirect to dashboard
        if (!isAdmin && isAdminPage) {
            res.sendRedirect(contextPath + DASHBOARD);
            return;
        }

        // Allow everything else
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
