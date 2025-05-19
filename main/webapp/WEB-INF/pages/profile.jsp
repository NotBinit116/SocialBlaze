<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile Settings</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/profile.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
</head>
<body>
    <!-- Include header -->
    <jsp:include page="header.jsp" />

    <div class="profile-container">
        <h2>Profile Details</h2>
        <div class="profile-form">
            <div class="profile-image-section">
                <c:choose>
				    <c:when test="${not empty user.imageUrl}">
				        <img src="${pageContext.request.contextPath}/resources/uploads/${user.imageUrl}" alt="Profile" class="profile-image" />
				    </c:when>
				    <c:otherwise>
				        <img src="${pageContext.request.contextPath}/resources/uploads/avatar1.jpg" alt="Profile" class="profile-image" />
				    </c:otherwise>
				</c:choose>
            </div>

            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" value="${user.username}" readonly />
            </div>

            <div class="form-group">
                <label for="full_name">Full Name</label>
                <input type="text" id="full_name" name="full_name" value="${user.fullName}" readonly />
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="${user.email}" readonly />
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" value="********" readonly />
            </div>

            <div class="button-group">
                <a href="${pageContext.request.contextPath}/dashboard" class="back-btn">Go Back</a>
            </div>
        </div>
    </div>

    <!-- Include footer -->
    <jsp:include page="footer.jsp" />
</body>
</html>
