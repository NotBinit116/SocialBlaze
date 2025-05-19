<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div id="admin-header">
    <header class="admin-header">
        <!-- Logo Section -->
        <h1 class="logo">
            <a href="${contextPath}/admin/home">
                <img src="${contextPath}/resources/uploads/logo.png" alt="Social Blaze Logo"/>
            </a>
        </h1>

        <!-- Admin Navigation Bar -->
        <nav>
            <ul class="admin-nav">
                <li><a href="${contextPath}/admindashboard">Admin Dashboard</a></li>
                <li><a href="${contextPath}/revenueoverview">Revenue Overview</a></li>
                <li><a href="${contextPath}/manageusers">Manage Users</a></li>
            </ul>
        </nav>

        <!-- Logout Button -->
        <div class="logout-button">
            <form action="${contextPath}/logout" method="post" style="display:inline;">
                <input type="submit" value="Logout" />
            </form>
        </div>
    </header>
</div>
