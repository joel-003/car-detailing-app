<%--
  Created by IntelliJ IDEA.
  User: Hp
  Date: 04-12-2025
  Time: 12:20 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="icon" type="image/png" href="./assets/water-rinse.png">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="./css/login.css" rel="stylesheet">
    <link href="./css/nav-bar.css" rel="stylesheet">
    <link href="./css/util.css" rel="stylesheet">
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
                <li><a href="register-user.jsp">Register</a></li>
            </ul>

        </nav>
    </div>


    <div class="auth-page">

        <div class="auth-card">

            <div class="auth-title">Login</div>
            <p class="auth-subtitle">welcome back</p>

            <!-- SUCCESS MESSAGE FROM register?success=true -->
            <%
                String regSuccess = request.getParameter("regSuccess");
                if ("true".equalsIgnoreCase(regSuccess)) {
            %>
            <div class="auth-msg success" id="successMessage">Registration successful! Please login.</div>
            <% } %>
            <!-- SUCCESS MESSAGE FROM ResetPassword ?success=message -->
            <%
                String resetSuccess = (String) request.getAttribute("resetSuccess");
                if ( resetSuccess != null) {
            %>
            <div class="auth-msg success" id="successMessage"><%= resetSuccess %></div>
            <% } %>

            <!-- ERROR MESSAGE FROM LoginServlet -->
            <% if (request.getAttribute("error") != null) { %>
            <div class="auth-msg error" id="errorMessage"><%= request.getAttribute("error") %></div>
            <% } %>

            <form action="login" method="post" class="auth-form">

                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input id="email" type="email" name="email" placeholder="your@email.com" required>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input id="password" type="password" name="password" placeholder="Enter password" minlength="6" required>
                </div>
                <div class="forgot-password">
                    <a href="forgot-password.jsp">Forgot Password?</a>
                </div>

                <button type="submit" class="auth-btn">Login</button>

                <div class="auth-bottom-text">
                    Don't have an account? <a href="register-user.jsp">Register</a>
                </div>

            </form>
        </div>

    </div>

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
            autoHide("successMessage", 5000);
        };
    </script>
</body>
</html>
