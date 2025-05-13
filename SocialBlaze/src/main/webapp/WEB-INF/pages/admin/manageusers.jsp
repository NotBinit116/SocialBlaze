<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <input type="text" placeholder="Search by name, email..." />
            <select>
                <option value="">All Roles</option>
                <option value="admin">Admin</option>
                <option value="user">User</option>
            </select>
            <button class="filter-btn">Search</button>
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
            <tbody>
                <tr>
                    <td>John Doe</td>
                    <td>john@example.com</td>
                    <td>User</td>
                    <td>2024-11-21</td>
                    <td>3</td>
                    <td>
                        <button class="edit-btn">Edit</button>
                        <button class="delete-btn">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>Jane Smith</td>
                    <td>jane@example.com</td>
                    <td>Admin</td>
                    <td>2024-09-15</td>
                    <td>5</td>
                    <td>
                        <button class="edit-btn">Edit</button>
                        <button class="delete-btn">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>Mike Lee</td>
                    <td>mike@example.com</td>
                    <td>User</td>
                    <td>2025-01-12</td>
                    <td>2</td>
                    <td>
                        <button class="edit-btn">Edit</button>
                        <button class="delete-btn">Delete</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
