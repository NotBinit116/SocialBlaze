<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="header">
    <header class="header">
        <!-- Logo Section -->
        <h1 class="logo">
            <a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/resources/logo.png" alt="Social Blaze Logo"/></a>
        </h1>

        <!-- Navigation Bar -->
        <nav>
            <ul class="main-nav">
                <li><a href="${pageContext.request.contextPath}/dashboard">Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/myaccounts">My Accounts</a></li>
                <li><a href="${pageContext.request.contextPath}/snapshots">Snapshots</a></li>
                <li><a href="${pageContext.request.contextPath}/postperformances">Post Performances</a></li>
                <li><a href="${pageContext.request.contextPath}/revenue">Revenue</a></li>
            </ul>
        </nav>

        <!-- Profile Section (Right-aligned) -->
        <div class="profile">
            <c:choose>
                <c:when test="${not empty sessionScope.username}">
                    <form action="${pageContext.request.contextPath}/login" method="post">
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
