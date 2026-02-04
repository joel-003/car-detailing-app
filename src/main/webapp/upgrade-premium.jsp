<%--
  Created by IntelliJ IDEA.
  User: Hp
  Date: 06-12-2025
  Time: 12:01 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upgrade Premium</title>
    <link rel="icon" type="image/png" href="./assets/water-rinse.png">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="./css/nav-bar.css" rel="stylesheet">
    <link href="./css/footer.css" rel="stylesheet">
    <link href="./css/upgrade-premium.css" rel="stylesheet">
</head>
<body>

<div class="site-header">
    <nav class="navbar">

        <div class="logo">
            <img src="./assets/car-logo-nav.png" alt="Logo" class="logo-img">
            <div class="logo-text">
                <h1>Joe Detailing</h1>
                <p>Premium Car Wash</p>
            </div>
        </div>

        <!-- Hamburger Icon -->
        <div class="hamburger" onclick="toggleMenu()">
            <span></span>
            <span></span>
            <span></span>
        </div>

        <ul class="nav-links" id="navLinks">

            <li><a href="index.jsp">Home</a></li>
            <li><a href="service.jsp">Service</a></li>

            <%
                String username = (String) session.getAttribute("USER_NAME");
                String membership = (String) session.getAttribute("MEMBERSHIP");

                if (username != null) {
            %>

            <li>
                <div class="user-box" id="userBox">
                    <div class="user-badge">
                        <%= username %> (<%= membership %>)
                        <span class="arrow material-icons">expand_more</span>
                    </div>

                    <div class="user-dropdown">
                        <a href="logout">Logout</a>
                    </div>
                </div>
            </li>

            <% }  %>
            <%
                if (username == null) {
                    response.sendRedirect("login.jsp?error=Please+login+first");
                    return;
                }
            %>

        </ul>

    </nav>
</div>

<section class="upgrade-hero">
    <div class="upgrade-content">

        <p class="section-label">— CAR WASH CLUB</p>

        <h1 class="upgrade-title">Unlimited Car Wash Club</h1>

        <p class="upgrade-subtitle">
            Join the Wash Club and enjoy unlimited washes with exclusive premium benefits tailored for your car.
        </p>

        <ul class="benefits-list">
            <li>Unlimited exterior washes</li>
            <li>Priority service and shorter wait times</li>
            <li>Exclusive discounts on other detailing services</li>
            <li>Complimentary interior vacuuming</li>
            <li>Special birthday month offers</li>
        </ul>

        <div class="upgrade-box">
            <h2 class="plan-title">Premium Membership</h2>
            <p class="plan-price">₹999 / month</p>
            <p class="plan-desc">Upgrade now and unlock unlimited premium benefits.</p>
            <h3 class="plan-desc">
                !Sorry upgrading premium via online/website is down. Online Upgrading will be soon.
            </h3>

            <form action="upgrade-membership" method="post">
                <button class="upgrade-btn" type="submit" disabled>Upgrade Now</button>
            </form>
        </div>
    </div>
</section>

<div class="site-footer">
    <footer class="footer">

        <div class="footer-top">
            <img src="./assets/car-logo-nav.png" alt="Logo" class="footer-logo">

            <h2>Joe Detailing</h2>
            <p class="tagline">Premium Car Wash</p>

            <p class="description">
                Joe Detailing keeps your car spotless with expert washing and detailing services.
            </p>

            <div class="footer-menu">
                <a href="./index.jsp">Home</a>
                <a href="./register-user.jsp">Login</a>
            </div>
        </div>

        <hr class="footer-line">

        <div class="footer-grid">

            <div class="footer-box">
                <div class="icon-circle">
                    <span class="material-icons">call</span>
                </div>
                <h3>PHONE NUMBERS</h3>
                <p>+91 908765xxxx</p>
                <p>+91 908545xxxx</p>
            </div>

            <div class="footer-box">
                <div class="icon-circle">
                    <span class="material-icons">mail</span>
                </div>
                <h3>EMAILS</h3>
                <p>joedetailing@example.email.com</p>
                <p>support@joedetailing.com</p>
            </div>

            <div class="footer-box">
                <div class="icon-circle">
                    <span class="material-icons">location_on</span>
                </div>
                <h3>ADDRESS</h3>
                <p>123 xxx street, TN 6200xx</p>
                <p>45 yyy city, TN 6432xx</p>
            </div>

            <div class="footer-box">
                <div class="icon-circle">
                    <span class="material-icons">schedule</span>
                </div>
                <h3>WORKING HOURS</h3>
                <p>Mon–Fri: 8:00 AM – 6:00 PM</p>
                <p>Sat: 9:00 AM – 5:00 PM</p>
            </div>

        </div>

    </footer>
</div>

<script src="./js/nav-bar.js"></script>
</body>
</html>
