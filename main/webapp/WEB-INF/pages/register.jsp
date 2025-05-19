<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
    <style>
    .error-message {
    color: #E63946; /* Crimson Red */
    font-size: 14px;
    font-weight: bold;
    text-align: center;
    margin-bottom: 8px;
}
    </style>
</head>
<body>
    <div class="register-container">
        <!-- Logo Section -->
        <div class="logo-header">
            <img src="${pageContext.request.contextPath}/resources/uploads/logo.png" alt="Social Blaze Logo" class="logo-img">
            <h2 class="form-title">Create Your Account</h2>
        </div>

        <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" name="username" id="username" required>
            </div>

            <div class="input-group">
                <label for="fullName">Full Name</label>
                <input type="text" name="fullName" id="fullName" required>
            </div>

            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" required>
            </div>

            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" required>
            </div>

            <div class="input-group">
                <label for="profileImage">Profile Image</label>
                <input type="file" name="profileImage" id="profileImage" accept="image/*">
            </div>

            <button type="submit">Register</button>
        </form>

        <p class="form-link">
            Already have an account?
            <a href="${pageContext.request.contextPath}/login">Login</a>
        </p>
    </div>
</body>
</html>
