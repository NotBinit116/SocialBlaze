<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="admin-header">
    <header class="admin-header">
        <!-- Logo Section -->
        <h1 class="logo">
            <a href="${pageContext.request.contextPath}/admin/home">
                <img src="${pageContext.request.contextPath}/resources/logo.png" alt="Social Blaze Logo"/>
            </a>
        </h1>

        <!-- Admin Navigation Bar -->
        <nav>
            <ul class="admin-nav">
                <li><a href="${pageContext.request.contextPath}/admindashboard">Admin Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/revenueoverview">Revenue Overview</a></li>
                <li><a href="${pageContext.request.contextPath}/manageusers">Manage Users</a></li>
            </ul>
        </nav>

        <!-- Admin Profile Section -->
        <div class="admin-profile">
            <c:choose>
                <c:when test="${not empty sessionScope.username}">
                    <form action="${contextPath}/logout" method="post">
                        <input type="submit" value="Logout" />
                    </form>
                </c:when>
                <c:otherwise>
                    <form action="${pageContext.request.contextPath}/login" method="get">
                        <input type="submit" value="Login" />
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </header>
</div>
