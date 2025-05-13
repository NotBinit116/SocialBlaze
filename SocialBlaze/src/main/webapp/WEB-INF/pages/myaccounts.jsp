<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Social Accounts</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/myaccounts.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
    <jsp:include page="header.jsp" />

        <div class="accounts-container">
        <div class="accounts-header">
            <h1>My Social Accounts</h1>
            <button class="add-account-btn">
                <i class="fas fa-plus"></i> Add Account
            </button>
        </div>

        <div class="accounts-grid">

            <!-- Account Card 1 -->
            <div class="account-card">
                <i class="fab fa-twitter platform-icon"></i>
                <h3>Twitter</h3>
                <p>Account Name: @socialguru</p>
                <a href="https://twitter.com/socialguru" target="_blank">https://twitter.com/socialguru</a>
                <div class="card-actions">
                    <button class="edit-btn">Edit</button>
                    <button class="delete-btn">Delete</button>
                </div>
            </div>

            <!-- Account Card 2 -->
            <div class="account-card">
                <i class="fab fa-instagram platform-icon"></i>
                <h3>Instagram</h3>
                <p>Account Name: @mediaqueen</p>
                <a href="https://instagram.com/mediaqueen" target="_blank">https://instagram.com/mediaqueen</a>
                <div class="card-actions">
                    <button class="edit-btn">Edit</button>
                    <button class="delete-btn">Delete</button>
                </div>
            </div>

            <!-- Account Card 3 -->
            <div class="account-card">
                <i class="fab fa-facebook platform-icon"></i>
                <h3>Facebook</h3>
                <p>Account Name: /brandpage</p>
                <a href="https://facebook.com/brandpage" target="_blank">https://facebook.com/brandpage</a>
                <div class="card-actions">
                    <button class="edit-btn">Edit</button>
                    <button class="delete-btn">Delete</button>
                </div>
            </div>

        </div>
    </div>
    <jsp:include page="footer.jsp" />
</body>
</html>
