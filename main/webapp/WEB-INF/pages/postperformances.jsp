<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Post Performance</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/postperformances.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
</head>
<body>
<jsp:include page="header.jsp" />

<div class="post-performance-container">

    <!-- Title and Add Form -->
    <div class="top-bar">
        <h2>Post Performance</h2>
    </div>

    <!-- Add New Post Form -->
    <div class="form-section">
    <h3 class="form-title">Add New Post</h3>
    <form action="${pageContext.request.contextPath}/postperformances" method="post" class="add-post-form">
        <input type="hidden" name="action" value="add" />
        
        <div class="form-row">
            <input type="text" name="postLink" placeholder="Post URL" required />
            <input type="date" name="date" required />
        </div>
        
        <div class="form-row">
            <input type="number" name="likes" placeholder="Likes" min="0" />
            <input type="number" name="comments" placeholder="Comments" min="0" />
        </div>
        
        <div class="form-row">
            <input type="number" name="views" placeholder="Views" min="0" />
            <input type="number" name="impressions" placeholder="Impressions" min="0" />
        </div>
        
        <div class="form-actions">
            <button type="submit" class="add-post-btn">Add Post</button>
        </div>
    </form>
</div>


    <!-- Posts Table -->
    <div class="table-section">
        <table class="performance-table">
            <thead>
                <tr>
                    <th>Post Link</th>
                    <th>Date</th>
                    <th>Likes</th>
                    <th>Comments</th>
                    <th>Views</th>
                    <th>Impressions</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="post" items="${postList}">
                    <tr>
                        <td><a href="${post.postURL}" target="_blank">${post.postURL}</a></td>
                        <td>${post.date}</td>
                        <td>${post.likes}</td>
                        <td>${post.comments}</td>
                        <td>${post.views}</td>
                        <td>${post.impressions}</td>
                        <td class="row-actions">
                            <form action="${pageContext.request.contextPath}/postperformances" method="post" style="display:inline;">
						    <input type="hidden" name="action" value="delete" />
						    <input type="hidden" name="postID" value="${post.postID}" />
						    <button type="submit" class="delete-btn">Delete</button>
						</form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
