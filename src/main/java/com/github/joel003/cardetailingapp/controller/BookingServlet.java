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
import java.time.LocalDate;

@WebServlet(value = "/book-service")
public class BookingServlet extends HttpServlet {

    public final BookingService bookingService;
    public BookingServlet() {
        this.bookingService = new BookingService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String packageName = req.getParameter("package");
        String priceStr = req.getParameter("price");

        try {
            Booking booking = new Booking();
            HttpSession session = req.getSession(false);

            if (session == null || session.getAttribute("USER_ID") == null) {
                resp.sendRedirect("login.jsp");
                return;
            }

            Long userId = (Long) session.getAttribute("USER_ID");
            if (userId == null) {
                throw new RuntimeException("User session expired. Please login again.");
            }

            booking.setUserId(userId);
            booking.setCustomerName((String) session.getAttribute("USER_NAME"));
            booking.setVehicleModel(req.getParameter("vehicleModel"));
            booking.setVehicleNumber(req.getParameter("vehicleNumber"));
            booking.setPackageName(packageName);
            booking.setPrice(Double.parseDouble(priceStr));
            booking.setBookingDate(LocalDate.parse(req.getParameter("date")));
            booking.setBookingTime(req.getParameter("time"));

            if(bookingService.isSlotBooked(booking)){
                req.setAttribute("error", "Selected time slot is already booked.");
                req.setAttribute("package", packageName);
                req.setAttribute("price", priceStr);
                req.getRequestDispatcher("booking.jsp").forward(req, resp);
                return;
            }

            boolean success = bookingService.saveBooking(booking);
            if(success){
                req.setAttribute("confirmed", true);
                req.getRequestDispatcher("booking.jsp").forward(req, resp);
            } else {
                throw new Exception("Database save failed.");
            }

        } catch (Exception e) {
            req.setAttribute("error", "Error: " + e.getMessage());
            req.setAttribute("package", packageName);
            req.setAttribute("price", priceStr);

            req.getRequestDispatcher("booking.jsp").forward(req, resp);
        }
    }
}
