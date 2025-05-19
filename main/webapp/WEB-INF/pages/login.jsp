<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <div class="login-container">
            <!-- Logo Section -->
        <div class="logo-header">
            <img src="${pageContext.request.contextPath}/resources/uploads/logo.png" alt="Social Blaze Logo" class="logo-img">
            <h2 class="form-title">Log Into Your Account</h2>
        </div>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Login</button>
        </form>
        <p class="form-link">
            Don't have an account?
            <a href="${pageContext.request.contextPath}/register">Register</a>
        </p>
    </div>
</body>
</html>
