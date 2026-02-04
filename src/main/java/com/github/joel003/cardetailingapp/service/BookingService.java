package com.github.joel003.cardetailingapp.service;

import com.github.joel003.cardetailingapp.dao.BookingDAO;
import com.github.joel003.cardetailingapp.model.Booking;

import java.util.List;

public class BookingService {

    private final BookingDAO bookingDAO ;

    public BookingService() {
        this.bookingDAO =  new BookingDAO();
    }

    public boolean isSlotBooked(Booking booking) {
        return bookingDAO.isSlotBooked(booking.getBookingDate(),booking.getBookingTime());
    }

    public boolean saveBooking(Booking booking) {
        return bookingDAO.saveBooking(booking);
    }

    public List<Booking> getBookingsByUser(Long userId) {
        return bookingDAO.getBookingsByUser(userId);
    }
    public List<Booking> getBookingsByAdmin() {
        return bookingDAO.getBookingsByAdmin();
    }

    public void markCompleted(int bookingId) {
        bookingDAO.markCompleted(bookingId);
    }
}
