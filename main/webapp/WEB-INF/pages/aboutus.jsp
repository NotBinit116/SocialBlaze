<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Us - Social Blaze</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/aboutus.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
    <jsp:include page="header.jsp" />

    <!-- Hero Banner -->
    <section class="about-hero">
        <h1>About Social Blaze</h1>
        <p>Empowering Your Social Journey Through Smart Analytics & Strategy</p>
    </section>

    <!-- Our Mission Section -->
    <section class="mission-section">
        <div class="mission-text">
            <h2>Our Mission</h2>
            <p>
                At Social Blaze, our mission is to empower individuals, creators, and marketing teams to thrive in the digital landscape. We aim to simplify social media analytics and growth with a platform that's powerful, intuitive, and accessible. By combining real-time data, actionable insights, and smart automation, we help users make informed decisions and stay ahead of the curve. We're committed to fostering transparency, innovation, and trust—delivering tools that truly make a difference. Our goal is to help you not just manage, but master your social presence.
			</p>
        </div>
        <div class="mission-img">
            <img src="${pageContext.request.contextPath}/resources/uploads/mission.jpg" alt="Our Mission">
        </div>
    </section>

    <!-- Core Values Section -->
    <section class="values-section">
        <h2>What We Stand For</h2>
        <div class="value-cards">
            <div class="value-card">
                <div class="value-icon"><i class="fas fa-shield-alt"></i></div>
                <h3>Trust & Security</h3>
                <p>Your privacy and data are our top priorities. We implement leading-edge security across the platform.</p>
            </div>
            <div class="value-card">
                <div class="value-icon"><i class="fas fa-lightbulb"></i></div>
                <h3>Innovation</h3>
                <p>We continuously enhance Social Blaze with new features based on user feedback and market trends.</p>
            </div>
            <div class="value-card">
                <div class="value-icon"><i class="fas fa-users"></i></div>
                <h3>Customer Focus</h3>
                <p>We succeed when our users succeed. That’s why your goals drive our development process.</p>
            </div>
        </div>
    </section>
    
    <!-- Platform Highlights Section -->
	<section class="highlights-section">
	    <h2>What Makes Social Blaze Stand Out</h2>
	    <div class="highlights-container">
	        <div class="highlight">
	            <i class="fas fa-bolt"></i>
	            <h3>Real-Time Analytics</h3>
	            <p>Monitor your social metrics with instant updates and dynamic graphs for actionable insights.</p>
	        </div>
	        <div class="highlight">
	            <i class="fas fa-user-shield"></i>
	            <h3>Privacy-First Design</h3>
	            <p>We implement top-tier security protocols to ensure your data stays protected at all times.</p>
	        </div>
	        <div class="highlight">
	            <i class="fas fa-sync-alt"></i>
	            <h3>Cross-Platform Sync</h3>
	            <p>Track accounts across platforms like Instagram, Twitter, and TikTok all in one place.</p>
	        </div>
	        <div class="highlight">
	            <i class="fas fa-rocket"></i>
	            <h3>Optimized Growth Tools</h3>
	            <p>Use our built-in suggestions, competitor insights, and trend alerts to scale faster than ever.</p>
	        </div>
	    </div>
	</section>
    

    <jsp:include page="footer.jsp" />
</body>
</html>
