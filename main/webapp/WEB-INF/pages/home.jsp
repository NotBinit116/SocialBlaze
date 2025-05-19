<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/validation.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
	.hero-section {
	    position: relative;
	    background-image: url('${pageContext.request.contextPath}/resources/uploads/hero-bg.jpg');
	    background-size: cover;
	    background-position: center;
	    height: 700px;
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	    text-align: center;
	    color: #fff;
	    padding: 0 20px;
	}
</style>
    
</head>
<body>
    <jsp:include page="header.jsp" />

    <!-- Hero Section -->
        <div class="hero-section">
		    <h1>Track & Grow Your Social Media Presence Effortlessly</h1>
		    <a href="${pageContext.request.contextPath}/dashboard" class="get-started-btn">Get Started</a>
		</div>

   <!-- Why Choose Us Section -->
    <section class="features">
        <h2>Why Choose Social Blaze</h2>
        <div class="feature-boxes">
            <div class="feature">
                <i class="fas fa-lock"></i>
                <h3>Secure Data Handling</h3>
                <p>Your data is encrypted and stored securely with the highest standards.</p>
            </div>
            <div class="feature">
                <i class="fas fa-desktop"></i>
                <h3>Easy-to-use UI</h3>
                <p>Our intuitive design makes navigating and managing your data seamless.</p>
            </div>
            <div class="feature">
                <i class="fas fa-users"></i>
                <h3>Trusted by Agencies</h3>
                <p>Top marketers and digital agencies rely on Social Blaze daily.</p>
            </div>
            <div class="feature">
                <i class="fas fa-layer-group"></i>
                <h3>Scalable for Teams</h3>
                <p>From solo creators to large teams, Social Blaze grows with you.</p>
            </div>
        </div>
    </section>

    <!-- About Us Section (Image Left, Text Right) -->
    <section class="about-us">
        <div class="about-img">
            <img src="${pageContext.request.contextPath}/resources/uploads/about.jpg" alt="About Us">
        </div>
		<div class="about-text">
		    <h2>About Social Blaze</h2>
		    <p>
		        At Social Blaze, we are passionate about empowering individuals, marketers, and agencies to track and grow their social media presence. We provide a powerful yet easy-to-use platform designed to analyze social media performance, optimize strategies, and engage with audiences effectively. Our team of experts continuously works to enhance the platform with cutting-edge tools and features, ensuring that our users stay ahead of the curve. Whether you're a solo content creator or part of a growing team, Social Blaze scales with you, helping you maximize your social impact. With a commitment to secure data handling and exceptional customer support, we’re proud to be a trusted partner for social media success. Join the millions already using Social Blaze to elevate their online presence.
		    </p>
		    
		    <!-- View More Button -->
		    <a href="${pageContext.request.contextPath}/aboutus" class="btn-secondary" style="margin-top: 20px; display: inline-block;">View More</a>
		</div>
	 </section>


    <!-- Pricing Preview Section -->
    <section class="pricing">
        <h2>Our Plans</h2>
        <p>Choose the plan that fits your needs.</p>
        <div class="pricing-tiers">
            <div class="tier">Free Plan</div>
            <div class="tier">Pro Plan</div>
            <div class="tier">Enterprise</div>
        </div>
        <a href="${pageContext.request.contextPath}/login" class="btn-secondary">Compare Plans</a>
    </section>

    <jsp:include page="footer.jsp" />
</body>
</html>
