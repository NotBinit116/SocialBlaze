<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="header">
    <header class="header">
        <!-- Logo Section -->
        <h1 class="logo">
            <a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/resources/uploads/logo.png" alt="Social Blaze Logo"/></a>
        </h1>

        <!-- Navigation Bar -->
        <nav>
            <ul class="main-nav">
                <li><a href="${pageContext.request.contextPath}/dashboard">Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/myaccounts">My Accounts</a></li>
                <li><a href="${pageContext.request.contextPath}/postperformances">Post Performances</a></li>
                <li><a href="${pageContext.request.contextPath}/revenue">Revenue</a></li>
            </ul>
        </nav>

        <!-- Profile Section (Right-aligned) -->
        <div class="profile">
            <c:choose>
                <c:when test="${not empty sessionScope.username}">
                    <div style="display: flex; align-items: center; gap: 10px;">
                        <a href="${pageContext.request.contextPath}/profile" style="display: flex; align-items: center; gap: 10px; text-decoration: none;">
						    <img src="${pageContext.request.contextPath}/resources/uploads/${sessionScope.profileImage}"
						         alt="Profile Picture"
						         style="width:40px; height:40px; border-radius:50%; object-fit:cover;" />
						    <span style="font-weight:bold; color:#333;">${sessionScope.username}</span>
						</a>

                        <form action="${pageContext.request.contextPath}/logout" method="post" style="margin-left:15px;">
                            <input type="submit" value="Logout" />
                        </form>
                    </div>
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
