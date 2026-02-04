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

@WebServlet("/my-bookings")
public class MyBookingsServlet extends HttpServlet {

    public final BookingService bookingService;
    public MyBookingsServlet() {
        this.bookingService = new BookingService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("USER_ID") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        Long userId = (Long) session.getAttribute("USER_ID");
        List<Booking> bookings = bookingService.getBookingsByUser(userId);

        req.setAttribute("bookings", bookings);
        req.getRequestDispatcher("my-bookings.jsp").forward(req, resp);
    }
}

