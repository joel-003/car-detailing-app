<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Joe Detailing</title>
    <link rel="icon" type="image/png" href="./assets/water-rinse.png">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="./css/nav-bar.css" rel="stylesheet">
    <link href="./css/footer.css" rel="stylesheet">
    <link href="./css/index.css" rel="stylesheet">


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
            <li><a href="login.jsp">Login</a></li>
            <li><a href="register-user.jsp">Register</a></li>
        </ul>

    </nav>
</div>

<!-- HERO SECTION -->
<section class="hero">
    <div class="hero-content">
        <span class="hero-tag">— WE WASH, YOU SHINE</span>
        <h1>Shining Cars,<br>Happy Drivers</h1>
        <p>Clean, shine, and care — your car deserves the best.</p>

        <div class="hero-actions">
            <a href="service.jsp" class="btn-primary">Book Now</a>
            <a href="#about" class="btn-outline">Explore</a>
        </div>
    </div>

    <div class="hero-image">
        <img src="./assets/car-main-test-edit.jpg" alt="Luxury Black Car">
    </div>
</section>

<!-- ABOUT SECTION -->
<section class="about" id="about">
    <div class="about-image">
        <img src="./assets/car-washing-foam.webp" alt="Car Wash Foam">
    </div>

    <div class="about-content">
        <span class="section-tag">ABOUT OUR CAR WASH</span>
        <h2>Because Your Ride<br>Deserves the Best</h2>

        <p>
            At Joe Detailing, we combine advanced techniques, eco-friendly
            products, and a passion for perfection to deliver top-quality
            car washing and detailing services.
        </p>

        <p>
            Whether it’s a quick touch-up or a thorough detailing session,
            our team ensures your car gets the attention it deserves.
        </p>

        <a href="service.jsp" class="btn-primary">Book Now</a>
    </div>
</section>

<!-- FEATURES -->
<section class="features">
    <div class="feature-card">
        <span class="material-icons icon">cleaning_services</span>
        <h3>Eco Cleaning</h3>
        <p>Eco-friendly products for your car and the planet.</p>
    </div>

    <div class="feature-card">
        <span class="material-icons icon">build</span>
        <h3>Advanced Tools</h3>
        <p>Modern equipment for a flawless wash.</p>
    </div>

    <div class="feature-card">
        <span class="material-icons icon">car_repair</span>
        <h3>Premium Care</h3>
        <p>Personalized services for a spotless shine.</p>
    </div>

    <div class="feature-card">
        <span class="material-icons icon">location_on</span>
        <h3>Easy Access</h3>
        <p>Convenient locations, always close to you.</p>
    </div>
</section>

<!-- FAQ -->
<section class="faq">
    <h2>COMMON <span>QUESTIONS</span></h2>

    <div class="faq-item">
        <b>How long does a full detail take?</b>
        <p>A full detailing service typically takes between 2 to 4 hours,
            depending on the vehicle size and service package.</p>
    </div>

    <div class="faq-item">
        <b>Do I need to make an appointment?</b>
        <p>Yes, we recommend booking in advance to ensure your preferred
            time slot is available.</p>
    </div>

    <div class="faq-item">
        <b>What products do you use?</b>
        <p>We use high-quality, eco-friendly cleaning products that are
            safe for your car and the environment.</p>
    </div>

    <div class="faq-item">
        <b>Do you offer mobile detailing?</b>
        <p>Currently, our services are available at our detailing center.
            Mobile services will be introduced soon.</p>
    </div>

    <div class="faq-item">
        <b>What payment methods do you accept?</b>
        <p>We accept cash, UPI, debit cards, credit cards, and online payments.</p>
    </div>

    <div class="faq-item">
        <b>Is there a warranty on your services?</b>
        <p>Yes, we offer a satisfaction guarantee. If you’re not happy,
            we’ll rework the service at no extra cost.</p>
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
</body>

</html>