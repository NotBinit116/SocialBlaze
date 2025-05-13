<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/adminheader.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/admindashboard.css" />
    <!-- Include Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <!-- Include header -->
    <jsp:include page="adminheader.jsp" />

    <main class="dashboard-container">
        <!-- Top Bar with Greeting -->
        <div class="top-bar">
            <h2>Welcome back, <c:out value="${sessionScope.username}" />!</h2>
        </div>

        <!-- Dashboard Cards -->
        <div class="dashboard-cards">
            <div class="card">
                <h3>Total Users</h3>
                <p>1,234</p>
            </div>
            <div class="card">
                <h3>Total Accounts</h3>
                <p>567</p>
            </div>
            <div class="card">
                <h3>Active Platforms</h3>
                <p>3</p>
            </div>
            <div class="card">
                <h3>Total Revenue</h3>
                <p>$12,345</p>
            </div>
        </div>

        <!-- Chart Visualization Section -->
        <section class="chart-section">
            <h3>Revenue Overview</h3>
            <canvas id="revenueChart"></canvas>
        </section>

        <!-- Recent Activity Section -->
        <section class="recent-activity">
            <h3>Recent Activity</h3>
            <table>
                <thead>
                    <tr>
                        <th>Post</th>
                        <th>Date</th>
                        <th>Likes</th>
                        <th>Comments</th>
                        <th>Views</th>
                        <th>Impressions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><a href="#">Post Title 1</a></td>
                        <td>2025-05-10</td>
                        <td>120</td>
                        <td>15</td>
                        <td>1,200</td>
                        <td>3,500</td>
                    </tr>
                    <tr>
                        <td><a href="#">Post Title 2</a></td>
                        <td>2025-05-09</td>
                        <td>98</td>
                        <td>10</td>
                        <td>950</td>
                        <td>2,800</td>
                    </tr>
                    <!-- Add more rows as needed -->
                </tbody>
            </table>
        </section>
    </main>

    <!-- Chart.js Script -->
    <script>
        const ctx = document.getElementById('revenueChart').getContext('2d');
        const revenueChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['January', 'February', 'March', 'April', 'May'],
                datasets: [{
                    label: 'Revenue',
                    data: [1200, 1900, 3000, 2500, 3200],
                    backgroundColor: 'rgba(241, 196, 15, 0.2)',
                    borderColor: '#F1C40F',
                    borderWidth: 2,
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: false
                    }
                }
            }
        });
    </script>
</body>
</html>
