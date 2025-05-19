<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.SocialBlaze.model.DashboardModel" %>

<%
    DashboardModel dashboard = (DashboardModel) request.getAttribute("dashboard");
    Map<String, Integer> followerGrowth = dashboard.getMonthlyFollowerGrowth();
    StringBuilder months = new StringBuilder();
    StringBuilder dataPoints = new StringBuilder();
    for (Map.Entry<String, Integer> entry : followerGrowth.entrySet()) {
        months.append("\"").append(entry.getKey()).append("\",");
        dataPoints.append(entry.getValue()).append(",");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard | Social Blaze</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<jsp:include page="header.jsp" />

    <div class="container">
        <h1>Welcome to Your Dashboard</h1>

        <!-- Summary Cards -->
        <div class="card-container">
            <div class="card">
                <h3>Total Accounts</h3>
                <p><%= dashboard.getTotalAccounts() %></p>
            </div>
            <div class="card">
                <h3>Total Posts</h3>
                <p><%= dashboard.getTotalPostCount() %></p>
            </div>
            <div class="card">
                <h3>Total Followers</h3>
                <p><%= dashboard.getTotalFollowerCount() %></p>
            </div>
        </div>

        <!-- Charts -->
        <div class="chart-container">
            <div class="chart-box">
                <h3>Follower Growth (Last 6 Months)</h3>
                <canvas id="lineChart" width="400" height="200"></canvas>
            </div>
            <div class="chart-box">
                <h3>Engagement Breakdown</h3>
                <canvas id="pieChart" width="400" height="200"></canvas>
            </div>
        </div>
    </div>
<jsp:include page="footer.jsp" />

    <script>
        // Line Chart: Follower Growth
        var lineCtx = document.getElementById('lineChart').getContext('2d');
        var lineChart = new Chart(lineCtx, {
            type: 'line',
            data: {
                labels: [<%= months.toString() %>],
                datasets: [{
                    label: 'Followers',
                    data: [<%= dataPoints.toString() %>],
                    borderColor: '#F1C40F',
                    backgroundColor: 'rgba(241, 196, 15, 0.2)',
                    borderWidth: 2,
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { display: true }
                }
            }
        });

        // Pie Chart: Engagement
        var pieCtx = document.getElementById('pieChart').getContext('2d');
        var pieChart = new Chart(pieCtx, {
            type: 'pie',
            data: {
                labels: ['Likes', 'Comments'],
                datasets: [{
                    data: [<%= dashboard.getTotalLikes() %>, <%= dashboard.getTotalComments() %>],
                    backgroundColor: ['#F1C40F', '#E63946'],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'top' }
                }
            }
        });
    </script>
</body>
</html>
