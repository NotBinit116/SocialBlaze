<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<footer id="footer">
    <div class="footer-container">
        <!-- Column 1: Logo -->
        <div class="footer-col">
            <a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/resources/uploads/logo.png" alt="Social Blaze Logo" class="footer-logo" /></a>
        </div>

        <!-- Column 2: Company -->
        <div class="footer-col">
            <h4>Company</h4>
            <ul>
                <li><a href="${pageContext.request.contextPath}/aboutus">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/contactus">Contact</a></li>
                <li>+977 9808812345</li>
                <li>+977 9843767890</li>
            </ul>
        </div>

        <!-- Column 3: Resources -->
        <div class="footer-col">
            <h4>Resources</h4>
            <ul>
                <li><a href="#">Help Center</a></li>
                <li><a href="#">Privacy Policy</a></li>
            </ul>
        </div>

        <!-- Column 4: Connect -->
        <div class="footer-col">
            <h4>Connect</h4>
            <ul class="social-links">
                <li><a href="https://x.com/i/flow/login"><i class="fab fa-twitter"></i> Twitter</a></li>
                <li><a href="https://www.reddit.com/login/"><i class="fab fa-reddit"></i> Reddit</a></li>
                <li><a href="https://www.instagram.com/accounts/login/#"><i class="fab fa-instagram"></i> Instagram</a></li>
            </ul>
        </div>
    </div>

    <!-- Copyright -->
    <div class="footer-bottom">
        <p>&copy; 2025 Social Blaze. All rights reserved.</p>
    </div>
</footer>
