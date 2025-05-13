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
        <h2>Profile Settings</h2>
        <form class="profile-form" action="updateProfile" method="post" enctype="multipart/form-data">
            <div class="profile-image-section">
                <img src="${pageContext.request.contextPath}/resources/avatar1.jpg" alt="Profile" class="profile-image" />
                <label for="profileImage" class="change-photo-label">Change Photo</label>
                <input type="file" id="profileImage" name="profileImage" accept="image/*" />
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" value="${user.username}" required />
                </div>
                <div class="form-group">
                    <label for="full_name">Full Name</label>
                    <input type="text" id="full_name" name="full_name" value="${user.full_name}" required />
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="${user.email}"/>
            </div>

            <div class="form-group">
                <label for="password">New Password</label>
                <input type="password" id="password" name="password" />
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" />
            </div>

            <div class="button-group">
                <button type="submit" class="save-btn">Save Changes</button>
                <button type="reset" class="cancel-btn">Cancel</button>
            </div>
        </form>
    </div>

    <!-- Include footer -->
    <jsp:include page="footer.jsp" />
</body>
</html>
