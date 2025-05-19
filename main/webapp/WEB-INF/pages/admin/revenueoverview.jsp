<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<jsp:include page="adminheader.jsp" />

<div class="admin-revenue-container">
    <h2>Revenue Overview</h2>

    <!-- Summary Cards -->
    <div class="summary-cards">
        <div class="card">Total Revenue<br/><span>$<fmt:formatNumber value="${totalRevenue}" type="number" minFractionDigits="2"/></span></div>
        <div class="card">Total Transactions<br/><span>${totalTransactions}</span></div>
        <div class="card">Paid Transactions<br/><span>${paidTransactions}</span></div>
        <div class="card">Pending Transactions<br/><span>${pendingTransactions}</span></div>
    </div>

    <!-- Charts -->
    <div class="chart-section">
        <div class="chart">
            <h4>Transaction Status Distribution</h4>
            <canvas id="statusPieChart"></canvas>
        </div>
        <div class="chart">
            <h4>Revenue by Platform</h4>
            <canvas id="platformRevenueChart"></canvas>
        </div>
    </div>

    <!-- Filter Toolbar -->
    <div class="filter-bar">
        <input type="text" id="searchInput" placeholder="Search by username..." />
        <input type="date" id="startDate" />
        <input type="date" id="endDate" />
        <button class="filter-btn" id="clearFiltersBtn">Clear Filters</button>
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
        <c:forEach var="rev" items="${revenueList}">
            <tr>
                <td>${rev.username}</td>
                <td>${rev.platformName}</td>
                <td>${rev.accountName}</td>
                <td><a href="${rev.profileURL}" target="_blank">Link</a></td>
                <td>$<fmt:formatNumber value="${rev.amount}" type="number" minFractionDigits="2"/></td>
                <td>
                    <span class="badge ${rev.paymentStatus}">
                        ${fn:toUpperCase(fn:substring(rev.paymentStatus, 0, 1))}${fn:substring(rev.paymentStatus, 1, fn:length(rev.paymentStatus))}
                    </span>
                </td>
                <td><fmt:formatDate value="${rev.transactionDate}" pattern="yyyy-MM-dd"/></td>
                <td><button>View</button></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Chart Scripts -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const searchInput = document.getElementById("searchInput");
        const startDateInput = document.getElementById("startDate");
        const endDateInput = document.getElementById("endDate");
        const clearFiltersBtn = document.getElementById("clearFiltersBtn");

        function parseDate(dateStr) {
            // Expecting "yyyy-MM-dd"
            const parts = dateStr.trim().split("-");
            if (parts.length !== 3) return null;
            const year = parseInt(parts[0], 10);
            const month = parseInt(parts[1], 10) - 1; // JS months are 0-indexed
            const day = parseInt(parts[2], 10);
            return new Date(year, month, day);
        }

        function filterTable() {
            const username = searchInput.value.toLowerCase();
            const startDate = startDateInput.value ? parseDate(startDateInput.value) : null;
            const endDate = endDateInput.value ? parseDate(endDateInput.value) : null;

            const rows = document.querySelectorAll(".revenue-table tbody tr");

            rows.forEach(row => {
                const usernameCell = row.cells[0]?.textContent.toLowerCase();
                const dateText = row.cells[6]?.textContent.trim();
                const rowDate = dateText ? parseDate(dateText) : null;

                const usernameMatch = usernameCell.includes(username);
                let dateMatch = true;

                if (startDate && (!rowDate || rowDate < startDate)) {
                    dateMatch = false;
                }
                if (endDate && (!rowDate || rowDate > endDate)) {
                    dateMatch = false;
                }

                row.style.display = (usernameMatch && dateMatch) ? "" : "none";
            });
        }

        searchInput.addEventListener("input", filterTable);
        startDateInput.addEventListener("change", filterTable);
        endDateInput.addEventListener("change", filterTable);
        clearFiltersBtn.addEventListener("click", () => {
            searchInput.value = "";
            startDateInput.value = "";
            endDateInput.value = "";
            filterTable();
        });

        // Initial run in case there's pre-filled data
        filterTable();
    });
</script>



</body>
</html>
