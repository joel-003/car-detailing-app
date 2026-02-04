<%--
  Created by IntelliJ IDEA.
  User: Hp
  Date: 06-12-2025
  Time: 04:36 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Booking</title>
    <link rel="icon" type="image/png" href="./assets/water-rinse.png">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="./css/nav-bar.css" rel="stylesheet">
    <link href="./css/util.css" rel="stylesheet">
    <link href="./css/footer.css" rel="stylesheet">
    <link href="./css/booking.css" rel="stylesheet">
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
                    <li><a href="my-bookings">My Bookings</a></li>

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


        <div class="booking-container">

            <h2>Book Your Service</h2>

            <!-- Get the Error -->
            <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
            <% } %>


            <!-- Run if Booking Confirmed -->
            <%
                Boolean confirmed = Boolean.TRUE.equals(request.getAttribute("confirmed"));
                if (confirmed) {
            %>

            <!-- BOOKING CONFIRMED UI -->
            <div class="booking-success">
                <h2>🎉 Booking Confirmed!</h2>
                <p>Your service has been successfully booked.</p>

                <a href="my-bookings" class="my-booking-btn">
                    View My Bookings
                </a>
            </div>

            <%
            } else {
            %>

            <%
                String packageName = (String) request.getAttribute("package");
                Object priceObj = request.getAttribute("price");

                if (packageName == null || priceObj == null) {
                    response.sendRedirect("service.jsp");
                    return;
                }

                double price = Double.parseDouble(priceObj.toString());
            %>

            <form action="book-service" method="post">

                <input type="hidden" name="package" value="<%= packageName %>">
                <input type="hidden" name="price" value="<%= price %>">

                <div class="summary-box">
                    <h3>Selected Package:</h3>
                    <p><b><%= packageName %></b></p>
                    <p>Price: ₹<%= price %></p>
                </div>

                <h3>Your Vehicle</h3>
                <input type="text" name="vehicleModel" placeholder="Vehicle Model (e.g., Swift VXI)" required>
                <input type="text" name="vehicleNumber" placeholder="Vehicle Number (TN 75 AB 1234)" required>

                <h3>Select Date</h3>
                <input type="date" name="date" required>

                <h3>Select Time Slot</h3>
                <select name="time" required>
                    <option value="">-- Select Time --</option>
                    <option value="09:00 AM">09:00 AM</option>
                    <option value="11:00 AM">11:00 AM</option>
                    <option value="01:00 PM">01:00 PM</option>
                    <option value="03:00 PM">03:00 PM</option>
                    <option value="05:00 PM">05:00 PM</option>
                </select>

                <button type="submit" class="confirm-btn">Confirm Booking</button>
            </form>
            <%
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
        <script>
            window.onload = function() {
                autoHide("errorMessage", 3000);
            };
        </script>

</body>
</html>
