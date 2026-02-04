<%@ page import="com.github.joel003.cardetailingapp.model.Booking" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Hp
  Date: 02-02-2026
  Time: 04:21 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Booking </title>
    <link rel="icon" type="image/png" href="./assets/water-rinse.png">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="./css/nav-bar.css" rel="stylesheet">
    <link href="./css/util.css" rel="stylesheet">
    <link href="./css/footer.css" rel="stylesheet">
    <link href="./css/my-booking.css" rel="stylesheet">
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
                <li><a href="#faq">FAQ</a></li>
                <li><a href="service.jsp">Services</a></li>

                <%
                    String username = (String) session.getAttribute("USER_NAME");
                    String membership = (String) session.getAttribute("MEMBERSHIP");

                    if (username != null) {
                %>
                <li>
                    <div class="premium-badge">
                        <% if (!"PREMIUM".equalsIgnoreCase(membership)) { %>
                        <a href="upgrade-premium.jsp" class="upgrade-link">Upgrade to Premium</a>
                        <% } %>
                    </div>
                </li>

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

    <div class="my-bookings-container">
        <h2>My Bookings</h2>

        <%
            List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
            if (bookings == null || bookings.isEmpty()) {
        %>
        <p class="empty">You have no bookings yet.</p>
        <%
        } else {
            for (Booking b : bookings) {
        %>

        <div class="booking-card">
            <div class="booking-header">
                <span class="package">
                    <%= b.getPackageName()
                            .replace("basicWash", "Basic Wash")
                            .replace("deluxeWash", "Deluxe Wash")
                            .replace("premiumWash", "Premium Wash")
                            .replace("ultimateWash", "Ultimate Wash")
                            .replace("dryCleaning", "Dry Cleaning")
                    %>
                </span>

                <span class="status <%= b.getStatus().name().toLowerCase() %>">
                <%= b.getStatus() %>
            </span>
            </div>

            <div class="booking-body">
                <p><b>Date:</b> <%= b.getBookingDate() %></p>
                <p><b>Time:</b> <%= b.getBookingTime() %></p>
                <p><b>Vehicle:</b> <%= b.getVehicleModel() %> – <%= b.getVehicleNumber() %></p>
                <p><b>Price:</b> ₹<%= b.getPrice() %></p>
            </div>
        </div>

        <%
                }
            }
        %>
    </div>
<!-- =======================
     Footer of the page
    ========================= -->
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
    <script src="./js/util.js"></script>
</body>
</html>
