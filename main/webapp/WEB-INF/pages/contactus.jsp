<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us | Social Blaze</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/contactus.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
</head>
<body>
<jsp:include page="header.jsp" />

<div class="contact-container">
    <h1>Contact Us</h1>
    <p class="subtext">Have questions or feedback? We'd love to hear from you.</p>
    <p class="phone-number"><strong>📞 Phone:</strong>+977 9808812345 or +977 9843767890</p>

    <form id="contactForm" class="contact-form">
        <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" placeholder="Your Name" required>
        </div>

        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="you@example.com" required>
        </div>

        <div class="form-group">
            <label for="subject">Subject</label>
            <input type="text" id="subject" name="subject" placeholder="Subject" required>
        </div>

        <div class="form-group">
            <label for="message">Your Message</label>
            <textarea id="message" name="message" placeholder="Write your message here..." rows="5" required></textarea>
        </div>

        <button type="submit" class="submit-btn">Send Message</button>
    </form>

    <div id="successMessage" class="success-message" style="display: none;">
        <p>✅ Your message has been sent successfully! We'll get back to you soon.</p>
        <button id="backBtn" class="back-btn">Back to Form</button>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script>
    const form = document.getElementById('contactForm');
    const successMsg = document.getElementById('successMessage');
    const backBtn = document.getElementById('backBtn');

    form.addEventListener('submit', function (e) {
        e.preventDefault();
        
        // Clear form fields
        form.reset();

        // Hide form, show success message
        form.style.display = 'none';
        successMsg.style.display = 'block';
    });

    backBtn.addEventListener('click', function () {
        successMsg.style.display = 'none';
        form.style.display = 'block';
    });
</script>
</body>
</html>
