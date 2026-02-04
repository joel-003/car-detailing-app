<%--
  Created by IntelliJ IDEA.
  User: Hp
  Date: 05-12-2025
  Time: 04:36 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Service</title>
    <link rel="icon" type="image/png" href="./assets/water-rinse.png">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="./css/nav-bar.css" rel="stylesheet">
    <link href="./css/util.css" rel="stylesheet">
    <link href="./css/footer.css" rel="stylesheet">
    <link href="./css/service.css" rel="stylesheet">
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
                if ("ADMIN".equals(session.getAttribute("ROLE"))) {
            %>
            <li><a href="admin/dashboard">Admin Dashboard</a></li>
            <%
                }
            %>


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

<!-- =======================
      SERVICE PACKAGES
========================= -->
<section class="pricing-section">

    <h2 class="section-title">Our Service Packages</h2>

    <% if(request.getAttribute("error") != null) { %>
    <div class="error-message" id="errorMessage">
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <div class="pricing-grid">

        <div class="price-card">
            <h3>Basic Wash <span>| 20 min</span></h3>
            <div class="price">₹699</div>

            <ul>
                <li>✔ Exterior hand wash</li>
                <li>✔ Spot-free rinse & dry</li>
                <li>✔ Basic interior vacuuming</li>
                <li class="na">✘ Waxing & polishing</li>
                <li class="na">✘ Deep stain removal</li>
            </ul>

            <form action="service" method="post">
                <input type="hidden" name="package" value="basicWash">
                <button type="submit" class="order-btn">Order Now</button>
            </form>
        </div>


        <div class="price-card">
            <h3>Deluxe Wash <span>| 40 min</span></h3>
            <div class="price">₹1299</div>
            <ul>
                <li>✔ Exterior wash + waxing</li>
                <li>✔ Interior vacuum & cleaning</li>
                <li>✔ Window cleaning</li>
                <li class="na">✘ Upholstery shampoo</li>
                <li class="na">✘ Engine cleaning</li>
            </ul>
            <form action="service" method="post">
                <input type="hidden" name="package" value="deluxeWash">
                <button type="submit" class="order-btn">Order Now</button>
            </form>
        </div>

        <div class="price-card">
            <h3>Premium Wash <span>| 60 min</span></h3>
            <div class="price">₹2499</div>
            <ul>
                <li>✔ Wash, wax & polish</li>
                <li>✔ Deep vacuum</li>
                <li>✔ Tire shine</li>
                <li class="na">✘ Engine cleaning</li>
                <li class="na">✘ Odor removal</li>
            </ul>
            <form action="service" method="post">
                <input type="hidden" name="package" value="premiumWash">
                <button type="submit" class="order-btn">Order Now</button>
            </form>
        </div>

        <div class="price-card ultimate">
            <div class="ultimate-overlay">

                <h3>Ultimate Wash <span>| 120 min</span></h3>
                <div class="price">₹4599</div>

                <ul>
                    <li>✔ Full wash + polishing</li>
                    <li>✔ Deep interior detailing</li>
                    <li>✔ Tire & wheel cleaning</li>
                    <li>✔ Window cleaning</li>
                    <li>✔ Odor removal + engine clean</li>
                </ul>

                <form action="service" method="post">
                    <input type="hidden" name="package" value="ultimateWash">
                    <button type="submit" class="order-btn">Order Now</button>
                </form>
            </div>
        </div>



    </div>
</section>

<section class="why-section">

    <div class="why-grid">

        <div class="why-card">
            <span class="material-icons icon">cleaning_services</span>
            <h3>Eco Cleaning</h3>
            <p>Eco-friendly solutions safe for your car and the environment.</p>
        </div>

        <div class="why-card">
            <span class="material-icons icon">build</span>
            <h3>Advanced Tools</h3>
            <p>Modern equipment ensures flawless cleaning results.</p>
        </div>

        <div class="why-card">
            <span class="material-icons icon">car_repair</span>
            <h3>Premium Care</h3>
            <p>Personalized detailing for a new-car feel.</p>
        </div>

        <div class="why-card">
            <span class="material-icons icon">location_on</span>
            <h3>Easy Access</h3>
            <p>Conveniently located service centers for quick visits.</p>
        </div>

    </div>

</section>


<section class="dry-section">

    <div class="dry-left">
        <h4>DRY CLEANING SERVICE</h4>
        <h2>Dry Cleaning</h2>
        <p>
            Our deep-cleaning service refreshes your interior with care,
            removing stains, odors, and dirt from carpets, seats, and upholstery.
        </p>
        <div class="dry-price">₹4599</div>

        <form action="service" method="post">
            <input type="hidden" name="package" value="dryCleaning">
            <button type="submit" class="dry-order-btn">Order Now</button>
        </form>

    </div>

    <div class="dry-right">

        <div class="dry-item">
            <span class="material-icons">search</span>
            <h3>Vacuuming</h3>
            <p>Deep cleaning of carpets, mats, corners & seats.</p>
        </div>

        <div class="dry-item">
            <span class="material-icons">dashboard</span>
            <h3>Surface Care</h3>
            <p>Polishing dashboards and plastic trims.</p>
        </div>

        <div class="dry-item">
            <span class="material-icons">air</span>
            <h3>Deodorizing</h3>
            <p>Removes odors and leaves your car smelling fresh.</p>
        </div>

    </div>

</section>


<section class="faq-section" id="faq">

    <h2>Frequently Asked Questions</h2>

    <div class="faq-item">
        <h3>Do I need to book in advance?</h3>
        <p>Booking is recommended, but walk-ins are accepted based on availability.</p>
    </div>

    <div class="faq-item">
        <h3>How long does a full service take?</h3>
        <p>On average, 45–120 minutes depending on the package.</p>
    </div>

    <div class="faq-item">
        <h3>Which package is best for me?</h3>
        <p>Premium is ideal for maintenance. Ultimate is best for deep cleaning.</p>
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
<script src="./js/util.js"></script>
<script>
    window.onload = function() {
        autoHide("errorMessage", 3000);
    };
</script>
</body>
</html>
