<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <c:forEach var="rev" items="${revenueList}">
        <tr>
            <td><a href="#">Post ID: ${rev.postID}</a></td>
            <td>${rev.amount}</td>
            <td>${rev.paymentMethodID}</td>
            <td><fmt:formatDate value="${rev.transactionDate}" pattern="yyyy-MM-dd" /></td>
            <td class="status-${rev.paymentStatus}">${rev.paymentStatus}</td>
        </tr>
    </c:forEach>
</tbody>

    </table>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
