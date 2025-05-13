<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Performance</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/postperformances.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
</head>
<body>
    <!-- Include header -->
    <jsp:include page="header.jsp" />

    <div class="post-performance-container">
        <h2>Post Performance</h2>

        <div class="sorting-controls">
            <label for="sort">Sort by:</label>
            <select id="sort">
                <option value="date">Date</option>
                <option value="likes">Likes</option>
                <option value="reach">Reach</option>
            </select>
        </div>

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
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><a href="#">https://example.com/post/1</a></td>
                        <td>2025-05-10</td>
                        <td>120</td>
                        <td>45</td>
                        <td>1000</td>
                        <td>1500</td>
                    </tr>
                    <tr>
                        <td><a href="#">https://example.com/post/2</a></td>
                        <td>2025-05-08</td>
                        <td>200</td>
                        <td>60</td>
                        <td>1800</td>
                        <td>2500</td>
                    </tr>
                    <tr>
				        <td><a href="#">https://example.com/post/1</a></td>
				        <td>2025-05-10</td>
				        <td>120</td>
				        <td>45</td>
				        <td>1000</td>
				        <td>1500</td>
				    </tr>
				    <tr>
				        <td><a href="#">https://example.com/post/2</a></td>
				        <td>2025-05-08</td>
				        <td>200</td>
				        <td>60</td>
				        <td>1800</td>
				        <td>2500</td>
				    </tr>
				    <tr>
				        <td><a href="#">https://example.com/post/3</a></td>
				        <td>2025-05-06</td>
				        <td>85</td>
				        <td>30</td>
				        <td>950</td>
				        <td>1400</td>
				    </tr>
				    <tr>
				        <td><a href="#">https://example.com/post/4</a></td>
				        <td>2025-05-05</td>
				        <td>310</td>
				        <td>120</td>
				        <td>3200</td>
				        <td>4100</td>
				    </tr>
				    <tr>
				        <td><a href="#">https://example.com/post/5</a></td>
				        <td>2025-05-03</td>
				        <td>190</td>
				        <td>50</td>
				        <td>1500</td>
				        <td>2000</td>
				    </tr>
				    <tr>
				        <td><a href="#">https://example.com/post/6</a></td>
				        <td>2025-05-01</td>
				        <td>60</td>
				        <td>15</td>
				        <td>500</td>
				        <td>800</td>
				    </tr>
                    <!-- More rows can be dynamically added here -->
                </tbody>
            </table>
        </div>
    </div>

    <!-- Include footer -->
    <jsp:include page="footer.jsp" />
</body>
</html>
