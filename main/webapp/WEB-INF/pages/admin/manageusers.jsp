<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Users - Admin</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/adminheader.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/manageusers.css" />
</head>
<body>
    <!-- Include header -->
    <jsp:include page="adminheader.jsp" />

    <div class="manage-users-container">
        <h2>Manage Users</h2>

        <!-- Search & Filter Bar -->
		<div class="filter-bar">
		    <input type="text" id="searchInput" placeholder="Search by name or email..." />
		</div>
		
		<!-- User Table -->
		<table class="users-table">
		    <thead>
		        <tr>
		            <th>Name</th>
		            <th>Email</th>
		            <th>Role</th>
		            <th>Registration Date</th>
		            <th>Accounts</th>
		            <th>Actions</th>
		        </tr>
		    </thead>
		    <tbody id="users-body">
		        <c:forEach var="user" items="${usersList}">
		            <tr>
		                <td>${user.fullName}</td>
		                <td>${user.email}</td>
		                <td>${user.role}</td>
		                <td>${user.registrationDate}</td>
		                <td>${user.accountCount}</td>
		                <td>
		                    <form method="post" action="${pageContext.request.contextPath}/manageusers" onsubmit="return confirm('Are you sure you want to delete this user?');">
		                        <input type="hidden" name="action" value="delete" />
		                        <input type="hidden" name="userID" value="${user.userID}" />
		                        <button type="submit" class="delete-btn">Delete</button>
		                    </form>
		                </td>
		            </tr>
		        </c:forEach>
		    </tbody>
		</table>
    </div>
    <script>
document.getElementById("searchInput").addEventListener("input", function () {
    const query = this.value;

    fetch("manageusers?search=" + encodeURIComponent(query))
        .then(response => response.text())
        .then(data => {
            document.getElementById("users-body").innerHTML = data;
        });
});
</script>
</body>
</html>
