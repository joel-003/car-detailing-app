package com.github.joel003.cardetailingapp.controller;

import com.github.joel003.cardetailingapp.model.Booking;
import com.github.joel003.cardetailingapp.service.BookingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    public final BookingService bookingService;
    public AdminDashboardServlet() {
        this.bookingService = new BookingService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || !"ADMIN".equals(session.getAttribute("ROLE"))) {
            response.sendRedirect("login.jsp");
            return;
        }
        List<Booking> bookings = bookingService.getBookingsByAdmin();
        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("admin-dashboard.jsp").forward(request, response);

    }
}
