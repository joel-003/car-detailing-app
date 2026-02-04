<%--
  Created by IntelliJ IDEA.
  User: Hp
  Date: 03-12-2025
  Time: 04:12 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <link rel="icon" type="image/png" href="./assets/water-rinse.png">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="./css/register-user.css" rel="stylesheet">
    <link href="./css/util.css" rel="stylesheet">
    <link href="./css/nav-bar.css" rel="stylesheet">
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
    <div class="form-wrapper">
        <div class="container">

            <% if(request.getAttribute("error") != null) { %>
            <div class="error-message" id="errorMessage">
                <%= request.getAttribute("error") %>
            </div>
            <% } %>

            <div class="title">Create Your Account</div>

            <form action="register" method="post">

                <div class="input-group">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" name="name" minlength="3" required>
                </div>

                <div class="input-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" minlength="6" required>
                </div>

                <div class="input-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" required>
                </div>

                <div class="input-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" required>
                </div>

                <button class="btn" type="submit">Register</button>

                <div class="login-link">
                    Already have an account?
                    <a href="login.jsp">Login</a>
                </div>

            </form>
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
    };
</script>
</body>
</html>

