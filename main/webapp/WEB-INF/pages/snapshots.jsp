<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Snapshots | Social Blaze</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/snapshots.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<!-- Include header -->
<jsp:include page="header.jsp" />

<div class="snapshots-container">
    <div class="top-controls">
        <div class="selectors">
            <label for="accountSelect">Account:</label>
            <select id="accountSelect">
                <option value="acc1">Account 1</option>
                <option value="acc2">Account 2</option>
            </select>

            <label for="dateRange">Date Range:</label>
            <input type="date" id="startDate"> to <input type="date" id="endDate">
        </div>
        <button class="export-btn"><i class="fa-solid fa-file-csv"></i> Export to CSV</button>
    </div>

    <h2>Your Snapshot Analytics</h2>

    <div class="charts-section">
        <div class="chart-box">
            <canvas id="lineChart"></canvas>
            <p class="chart-label">Follower Count Over Time</p>
        </div>
        <div class="chart-box">
            <canvas id="barChart"></canvas>
            <p class="chart-label">Post/Reach/Impression Distribution</p>
        </div>
    </div>

    <div class="table-section">
        <h3>Snapshot History</h3>
        <table class="snapshot-table">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Follower Count</th>
                    <th>Post Count</th>
                    <th>Impressions</th>
                    <th>Reach</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>2025-05-01</td>
                    <td>1,230</td>
                    <td>45</td>
                    <td>10,200</td>
                    <td>8,950</td>
                </tr>
                <tr>
                    <td>2025-05-02</td>
                    <td>1,245</td>
                    <td>47</td>
                    <td>10,800</td>
                    <td>9,300</td>
                </tr>
                <!-- Add more rows as needed -->
            </tbody>
        </table>
    </div>
</div>

<!-- Include footer -->
<jsp:include page="footer.jsp" />

<script>
    // Dummy Line Chart
    new Chart(document.getElementById('lineChart'), {
        type: 'line',
        data: {
            labels: ['May 1', 'May 2', 'May 3', 'May 4'],
            datasets: [{
                label: 'Followers',
                data: [1230, 1245, 1260, 1280],
                borderColor: '#4b7bec',
                backgroundColor: 'rgba(75, 123, 236, 0.1)',
                fill: true,
                tension: 0.4
            }]
        }
    });

    // Dummy Bar Chart
    new Chart(document.getElementById('barChart'), {
        type: 'bar',
        data: {
            labels: ['Posts', 'Impressions', 'Reach'],
            datasets: [{
                label: 'Count',
                data: [45, 10200, 8950],
                backgroundColor: ['#26de81', '#fed330', '#fc5c65']
            }]
        }
    });
</script>
</body>
</html>
