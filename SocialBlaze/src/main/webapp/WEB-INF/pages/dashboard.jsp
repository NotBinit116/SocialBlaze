<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dashboard.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <!-- Include header -->
    <jsp:include page="header.jsp" />

    <!-- Dashboard Section -->
    <section class="dashboard">
        <div class="metrics-cards">
            <!-- Total Accounts Card -->
            <div class="card">
                <h3>Total Accounts</h3>
                <p>1200</p>
            </div>

            <!-- Total Engagement Card -->
            <div class="card">
                <h3>Total Engagement</h3>
                <p>5000</p>
            </div>

            <!-- Growth Rate Card -->
            <div class="card">
                <h3>Growth Rate</h3>
                <p>25%</p>
            </div>
        </div>

		<!-- Analytics Section -->
		<div class="analytics-section">
		    <div class="analytics-header">
		        Your Analytics
		    </div>
		
		    <!-- Flex container for charts (Line Chart on left, Pie Chart on right) -->
		    <div class="chart-container">
		        <!-- Line Chart Box -->
		        <div class="chart-box">
		            <canvas id="lineChart"></canvas>
		            <p class="chart-description">Follower growth over the last 6 months.</p>
		        </div>
		        
		        <!-- Pie Chart Box -->
		        <div class="chart-box pie-chart"> <!-- Added 'pie-chart' class here -->
		            <canvas id="pieChart"></canvas>
		        </div>
		    </div>
		</div>

    </section>

    <!-- Include footer -->
    <jsp:include page="footer.jsp" />

    <script>
        // Line Chart for Follower Growth
        var lineChartCtx = document.getElementById('lineChart').getContext('2d');
        var lineChart = new Chart(lineChartCtx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Follower Growth',
                    data: [50, 100, 150, 200, 250, 300],
                    borderColor: '#F1C40F',
                    backgroundColor: 'rgba(241, 196, 15, 0.2)',
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: false
                    }
                }
            }
        });

        // Pie Chart for Engagement Distribution
        var pieChartCtx = document.getElementById('pieChart').getContext('2d');
        var pieChart = new Chart(pieChartCtx, {
            type: 'pie',
            data: {
                labels: ['Likes', 'Comments', 'Shares'],
                datasets: [{
                    label: 'Engagement Distribution',
                    data: [60, 25, 15],
                    backgroundColor: ['#F1C40F', '#E63946', '#1D3557'],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top'
                    }
                }
            }
        });
    </script>
</body>
</html>
