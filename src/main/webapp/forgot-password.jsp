<%--
  Created by IntelliJ IDEA.
  User: Hp
  Date: 04-12-2025
  Time: 05:02 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forget Password</title>
    <link rel="icon" type="image/png" href="./assets/water-rinse.png">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="./css/util.css" rel="stylesheet">
    <link href="./css/nav-bar.css" rel="stylesheet">
    <link href="./css/forget-password.css" rel="stylesheet">
    <link href="./css/footer.css" rel="stylesheet">
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
                <li><a href="login.jsp">Login</a></li>
            </ul>

        </nav>
    </div>

    <div class="page-bg">
    <div class="fp-wrapper">
        <div class="fp-card">

            <h2 class="fp-title">Forgot Password</h2>

            <% if (request.getAttribute("error") != null) { %>
            <div class="fp-error" id="errorMessage"><%= request.getAttribute("error") %></div>
            <% } %>

            <% if (request.getAttribute("message") != null) { %>
            <div class="fp-success" id="successMessage"><%= request.getAttribute("message") %></div>
            <% } %>

            <%
                String resetEmail = (String) session.getAttribute("RESET-EMAIL");
            %>
            <% if (resetEmail == null) { %>

            <form action="forgot-password" method="post">
                <div class="fp-input-group">
                    <label>Enter your email</label>
                    <input type="email" name="email" required placeholder="Enter registered email">
                </div>

                <button type="submit" class="fp-btn">Continue</button>
            </form>
            <div class="fp-login-link">
                <a href="login.jsp">Back to Login</a>
            </div>

            <% } else { %>

            <p>Resetting password for: <strong><%= resetEmail %></strong></p>

            <form action="reset-password" method="post">
                <div class="fp-input-group">
                    <label>New Password</label>
                    <input type="password" name="newPassword" minlength="6" required>
                </div>

                <button type="submit" class="fp-btn">Reset Password</button>
            </form>

            <% } %>

        </div>
    </div>
    </div>
    <!-- footer -->
    <div class="site-footer">
        <footer class="footer">

            <!-- Top Logo + Description -->
            <div class="footer-top">
                <img src="./assets/car-logo-nav.png" alt="Logo" class="footer-logo">

                <h2>Joe Detailing</h2>
                <p class="tagline">Premium Car Wash</p>

                <p class="description">
                    Joe Detailing keeps your car spotless with expert washing and detailing services.
                </p>

                <div class="footer-menu">
                    <a href="./register-user.jsp">Home</a>
                    <a href="./login.jsp">Login</a>
                </div>
            </div>

            <hr class="footer-line">

            <!-- 4 Columns -->
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
            autoHide("successMessage", 5000);
        };
    </script>
</body>
</html>
