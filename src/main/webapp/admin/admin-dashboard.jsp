<%@ page import="java.util.List" %>
<%@ page import="com.github.joel003.cardetailingapp.model.Booking" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="icon" type="image/png" href="./assets/water-rinse.png">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="../css/nav-bar.css" rel="stylesheet">
    <link href="../css/util.css" rel="stylesheet">
    <link href="../css/admin.css?v=2" rel="stylesheet">
</head>
<body>

<div class="site-header">
    <nav class="navbar">

        <div class="logo">
            <img src="../assets/car-logo-nav.png" alt="Logo" class="logo-img">
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

            <li><a href="../index.jsp">Home</a></li>
            <li><a href="../service.jsp">Services</a></li>


            <%
                String username = (String) session.getAttribute("USER_NAME");
                String membership = (String) session.getAttribute("MEMBERSHIP");

                if (username != null) {
            %>
            <li>
                <div class="premium-badge">
                    <% if (!"PREMIUM".equalsIgnoreCase(membership)) { %>
                    <a href="../upgrade-premium.jsp" class="upgrade-link">Upgrade to Premium</a>
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
                        <a href="<%= request.getContextPath() %>/logout">Logout</a>
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

<h2 class="title">Admin Dashboard</h2>

        <% if(request.getAttribute("error") != null) { %>
        <div class="error-message" id="errorMessage">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>

<div class="admin-container">

    <%
        List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
        if (bookings == null || bookings.isEmpty()) {
    %>
    <p class="empty">No bookings found</p>
    <%
    } else {
        for (Booking b : bookings) {
    %>

    <div class="admin-card">

        <div class="card-header">
            <h3><%= b.getPackageName() %></h3>

            <span class="status <%= b.getStatus().name().toLowerCase() %>">
            <%= b.getStatus() %>
        </span>
        </div>

        <p><b>Customer:</b> <%= b.getCustomerName() %></p>
        <p><b>Vehicle:</b> <%= b.getVehicleModel() %> – <%= b.getVehicleNumber() %></p>
        <p><b>Date:</b> <%= b.getBookingDate() %></p>
        <p><b>Time:</b> <%= b.getBookingTime() %></p>
        <p><b>Price:</b> ₹<%= b.getPrice() %></p>

        <% if (b.getStatus().name().equals("CONFIRMED")) { %>

        <form action="${pageContext.request.contextPath}/admin/mark-completed" method="post">
            <input type="hidden" name="bookingId" value="<%= b.getId() %>">
            <button class="complete-btn">Mark Completed</button>
        </form>
        <% } %>

    </div>

    <%
            }
        }
    %>

</div>

<script src="../js/nav-bar.js"></script>
<script src="../js/util.js"></script>
<script>
    window.onload = function() {
        autoHide("errorMessage", 3000);
    };
</script>

</body>
</html>
