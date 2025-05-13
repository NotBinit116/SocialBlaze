<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Revenue Overview - Admin</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/adminheader.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/revenueoverview.css" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <!-- Include header -->
    <jsp:include page="adminheader.jsp" />

    <div class="admin-revenue-container">
        <h2>Revenue Overview</h2>

        <!-- Summary Cards -->
        <div class="summary-cards">
            <div class="card">Total Revenue<br/><span>$82,400</span></div>
            <div class="card">Total Transactions<br/><span>1,250</span></div>
            <div class="card">Paid Transactions<br/><span>820</span></div>
            <div class="card">Pending Transactions<br/><span>320</span></div>
        </div>

        <!-- Charts -->
        <div class="chart-section">
            <div class="chart">
                <canvas id="statusPieChart"></canvas>
            </div>
            <div class="chart">
                <canvas id="platformRevenueChart"></canvas>
            </div>
        </div>

        <!-- Filter Toolbar -->
        <div class="filter-bar">
            <input type="text" placeholder="Search by user/platform..." />
            <input type="date" />
            <input type="date" />
            <button class="filter-btn">Filter</button>
        </div>

        <!-- Table Heading -->
        <h3 class="table-heading">Revenue Data Table</h3>

        <!-- Revenue Table -->
        <table class="revenue-table">
            <thead>
                <tr>
                    <th>User Name</th>
                    <th>Platform</th>
                    <th>Account Name</th>
                    <th>URL</th>
                    <th>Amount</th>
                    <th>Status</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>John Doe</td>
                    <td>Instagram</td>
                    <td>@johndoe</td>
                    <td><a href="#">profile</a></td>
                    <td>$120</td>
                    <td><span class="badge paid">Paid</span></td>
                    <td>2025-05-01</td>
                    <td><button>View</button></td>
                </tr>
                <tr>
                    <td>Jane Smith</td>
                    <td>YouTube</td>
                    <td>@janesmith</td>
                    <td><a href="#">channel</a></td>
                    <td>$340</td>
                    <td><span class="badge pending">Pending</span></td>
                    <td>2025-05-02</td>
                    <td><button>View</button></td>
                </tr>
                <tr>
                    <td>Mike Lee</td>
                    <td>TikTok</td>
                    <td>@mikelee</td>
                    <td><a href="#">link</a></td>
                    <td>$75</td>
                    <td><span class="badge failed">Failed</span></td>
                    <td>2025-05-03</td>
                    <td><button>View</button></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Chart Scripts -->
    <script>
        const pieCtx = document.getElementById('statusPieChart').getContext('2d');
        const pieChart = new Chart(pieCtx, {
            type: 'pie',
            data: {
                labels: ['Paid', 'Pending', 'Failed'],
                datasets: [{
                    label: 'Transaction Status',
                    data: [820, 320, 110],
                    backgroundColor: ['#2ecc71', '#f39c12', '#e74c3c']
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'bottom'
                    }
                }
            }
        });

        const barCtx = document.getElementById('platformRevenueChart').getContext('2d');
        const barChart = new Chart(barCtx, {
            type: 'bar',
            data: {
                labels: ['Instagram', 'YouTube', 'TikTok', 'Twitter'],
                datasets: [{
                    label: 'Revenue by Platform',
                    data: [22000, 30000, 15000, 12000],
                    backgroundColor: '#1D3557'
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                },
                plugins: {
                    legend: {
                        display: false
                    }
                }
            }
        });
    </script>
</body>
</html>
