<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Social Accounts</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/myaccounts.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="accounts-container">
    <div class="accounts-header">
        <h1>My Social Accounts</h1>
        <button id="add-account-btn" class="add-account-btn">
            <i class="fas fa-plus"></i> Add Account
        </button>
    </div>

    <c:if test="${not empty error}">
        <div class="error-message" style="color: red; margin-bottom: 15px;">
            ${error}
        </div>
    </c:if>

    <div class="accounts-grid">
        <c:choose>
            <c:when test="${not empty accounts}">
                <c:forEach var="account" items="${accounts}">
                    <div class="account-card">
                        <i class="${platformIcons[account.platformId]} platform-icon"></i>
                        <h3>${platformNames[account.platformId]}</h3>
                        <p>Account Name: ${account.accountName}</p>
                        <a href="${account.profileURL}" target="_blank">${account.profileURL}</a>
                        <div class="card-actions">
                            <!-- Edit Button -->
                            <button class="edit-btn" 
                                    data-accountid="${account.accountId}"
                                    data-platform="${account.platformId}"
                                    data-accountname="${account.accountName}"
                                    data-profileurl="${account.profileURL}"
                                    onclick="openEditFlyout(this)">
                                Edit
                            </button>

                            <!-- Delete Form -->
                            <form method="POST" action="${pageContext.request.contextPath}/myaccounts" style="display:inline;">
                                <input type="hidden" name="deleteAccountId" value="${account.accountId}" />
                                <button type="submit" class="delete-btn" onclick="return confirm('Are you sure you want to delete this account?');">Delete</button>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p>No social accounts found.</p>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- Add Account Flyout -->
<div id="add-flyout-overlay" class="flyout-overlay hidden" onclick="closeAddFlyout()"></div>
<div id="add-flyout" class="flyout hidden">
    <form id="addForm" method="POST" action="${pageContext.request.contextPath}/myaccounts">
        <h2><i class="fas fa-plus"></i> Add Account</h2>

        <label for="add-platform">Platform Name:</label>
        <select id="add-platform" name="platform" required>
            <option value="1">Facebook</option>
            <option value="2">Instagram</option>
            <option value="3">Twitter</option>
            <option value="4">YouTube</option>
        </select>

        <label for="add-accountName">Account Name:</label>
        <input type="text" id="add-accountName" name="accountName" required>

        <label for="add-profileURL">Profile URL:</label>
        <input type="url" id="add-profileURL" name="profileURL" required>

        <button type="submit">Save</button>
    </form>
</div>

<!-- Edit Account Flyout -->
<div id="edit-flyout-overlay" class="flyout-overlay hidden" onclick="closeEditFlyout()"></div>
<div id="edit-flyout" class="flyout hidden">
    <form id="editForm" method="POST" action="${pageContext.request.contextPath}/myaccounts">
        <h2><i class="fas fa-edit"></i> Edit Account</h2>

        <input type="hidden" id="edit-accountId" name="editAccountId" />

        <label for="edit-platform">Platform Name:</label>
        <select id="edit-platform" name="platform" required>
            <option value="1">Facebook</option>
            <option value="2">Instagram</option>
            <option value="3">Twitter</option>
            <option value="4">YouTube</option>
        </select>

        <label for="edit-accountName">Account Name:</label>
        <input type="text" id="edit-accountName" name="accountName" required>

        <label for="edit-profileURL">Profile URL:</label>
        <input type="url" id="edit-profileURL" name="profileURL" required>

        <button type="submit">Update</button>
    </form>
</div>

<jsp:include page="footer.jsp" />

<!-- JS Scripts -->
<script>
    // Add Flyout
    const addFlyout = document.getElementById('add-flyout');
    const addOverlay = document.getElementById('add-flyout-overlay');
    const addBtn = document.getElementById('add-account-btn');
    const addForm = document.getElementById('addForm');

    addBtn.addEventListener('click', () => {
        addForm.reset();
        addFlyout.classList.remove('hidden');
        addOverlay.classList.remove('hidden');
    });

    function closeAddFlyout() {
        addFlyout.classList.add('hidden');
        addOverlay.classList.add('hidden');
    }

    // Edit Flyout
    const editFlyout = document.getElementById('edit-flyout');
    const editOverlay = document.getElementById('edit-flyout-overlay');
    const editForm = document.getElementById('editForm');

    function openEditFlyout(button) {
        editForm.reset();

        document.getElementById('edit-accountId').value = button.getAttribute('data-accountid');
        document.getElementById('edit-platform').value = button.getAttribute('data-platform');
        document.getElementById('edit-accountName').value = button.getAttribute('data-accountname');
        document.getElementById('edit-profileURL').value = button.getAttribute('data-profileurl');

        editFlyout.classList.remove('hidden');
        editOverlay.classList.remove('hidden');
    }

    function closeEditFlyout() {
        editFlyout.classList.add('hidden');
        editOverlay.classList.add('hidden');
    }
</script>

</body>
</html>
