<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Revenue</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/revenue.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="revenue-page">
    <h2 class="page-title">Revenue Overview</h2>

    <div class="revenue-summary">
        <div class="summary-box">
            <h3>Total Earnings</h3>
            <p>$12,450.00</p>
        </div>
    </div>

    <div class="metric-cards">
        <div class="metric-card">
            <i class="fas fa-dollar-sign icon"></i>
            <div>
                <h4>Total Revenue</h4>
                <p>$12,450.00</p>
            </div>
        </div>
        <div class="metric-card">
            <i class="fas fa-clock icon"></i>
            <div>
                <h4>Pending Payments</h4>
                <p>$1,200.00</p>
            </div>
        </div>
        <div class="metric-card">
            <i class="fas fa-times-circle icon"></i>
            <div>
                <h4>Failed Payments</h4>
                <p>$300.00</p>
            </div>
        </div>
    </div>

    <div class="revenue-filters">
        <div class="filter-options">
            <label>Status:
                <select>
                    <option>All</option>
                    <option>Paid</option>
                    <option>Pending</option>
                    <option>Failed</option>
                </select>
            </label>
            <label>Date:
                <input type="date" />
            </label>
        </div>
        <button class="export-btn"><i class="fa-solid fa-file-export"></i> Export Report</button>
    </div>

    <table class="revenue-table">
        <thead>
            <tr>
                <th>Post</th>
                <th>Amount</th>
                <th>Method</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><a href="#">https://example.com/post/1</a></td>
                <td>$500.00</td>
                <td>PayPal</td>
                <td>2025-05-01</td>
                <td class="status-paid">Paid</td>
            </tr>
            <tr>
                <td><a href="#">https://example.com/post/2</a></td>
                <td>$200.00</td>
                <td>Stripe</td>
                <td>2025-05-03</td>
                <td class="status-pending">Pending</td>
            </tr>
            <tr>
                <td><a href="#">https://example.com/post/3</a></td>
                <td>$100.00</td>
                <td>PayPal</td>
                <td>2025-05-04</td>
                <td class="status-failed">Failed</td>
            </tr>
            <tr>
                <td><a href="#">https://example.com/post/4</a></td>
                <td>$750.00</td>
                <td>Bank Transfer</td>
                <td>2025-05-07</td>
                <td class="status-paid">Paid</td>
            </tr>
        </tbody>
    </table>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
