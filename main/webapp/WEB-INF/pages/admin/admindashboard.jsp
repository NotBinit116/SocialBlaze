<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.SocialBlaze.model.AdminDashboardModel" %>
<%@ page import="java.util.*" %>
<%
    AdminDashboardModel dashboard = (AdminDashboardModel) request.getAttribute("dashboard");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/adminheader.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/admindashboard.css" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet" />
</head>
<body>
<jsp:include page="adminheader.jsp" />
<div class="dashboard-container">

    <div class="top-bar">
        <h2>Admin Dashboard</h2>
    </div>

    <!-- Dashboard Cards -->
    <div class="dashboard-cards">
        <div class="card">
            <h3>Total Users</h3>
            <p><%= dashboard.getTotalUsers() %></p>
        </div>
        <div class="card">
            <h3>Total Accounts</h3>
            <p><%= dashboard.getTotalAccounts() %></p>
        </div>
        <div class="card">
            <h3>Active Platforms</h3>
            <p><%= dashboard.getActivePlatforms() %></p>
        </div>
        <div class="card">
            <h3>Total Revenue</h3>
            <p>$<%= String.format("%.2f", dashboard.getTotalRevenue()) %></p>
        </div>
    </div>

    <!-- Revenue Chart -->
    <div class="chart-section">
        <h3>Revenue - Last 5 Months</h3>
        <canvas id="revenueChart"></canvas>
    </div>

    <!-- Recent Posts -->
    <div class="recent-activity">
        <h3>Recent Posts</h3>
        <table>
            <thead>
                <tr>
                    <th>Post URL</th>
                    <th>Date</th>
                    <th>Likes</th>
                    <th>Comments</th>
                    <th>Views</th>
                    <th>Impressions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Map<String, Object> post : dashboard.getRecentPosts()) { %>
                    <tr>
                        <td><a href="<%= post.get("PostURL") %>" target="_blank">View</a></td>
                        <td><%= post.get("Date") %></td>
                        <td><%= post.get("Likes") %></td>
                        <td><%= post.get("Comments") %></td>
                        <td><%= post.get("Views") %></td>
                        <td><%= post.get("Impressions") %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

</div>

<script>
    const ctx = document.getElementById('revenueChart').getContext('2d');
    const revenueChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [<% for (int i = 0; i < dashboard.getRevenueMonths().size(); i++) {
                out.print("\"" + dashboard.getRevenueMonths().get(i) + "\"");
                if (i < dashboard.getRevenueMonths().size() - 1) out.print(", ");
            } %>],
            datasets: [{
                label: 'Revenue ($)',
                data: [<% for (int i = 0; i < dashboard.getRevenueAmounts().size(); i++) {
                    out.print(dashboard.getRevenueAmounts().get(i));
                    if (i < dashboard.getRevenueAmounts().size() - 1) out.print(", ");
                } %>],
                backgroundColor: '#F1C40F'
            }]
        },
        options: {
            scales: {
                y: { beginAtZero: true }
            }
        }
    });
</script>

</body>
</html>
