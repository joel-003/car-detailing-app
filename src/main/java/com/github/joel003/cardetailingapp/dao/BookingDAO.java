package com.github.joel003.cardetailingapp.dao;

import com.github.joel003.cardetailingapp.model.Booking;
import com.github.joel003.cardetailingapp.model.BookingStatus;
import com.github.joel003.cardetailingapp.util.JPAUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.time.LocalDate;
import java.util.List;

public class BookingDAO {

    public boolean isSlotBooked(LocalDate bookingDate, String bookingTime) {
        EntityManager entityManager = JPAUtil.getEntityManager();

        try{
            Long count = entityManager.createQuery(
                    "SELECT COUNT(b) FROM Booking b WHERE b.bookingDate = :bookingDate AND b.bookingTime = :bookingTime", Long.class)
                    .setParameter("bookingDate",bookingDate)
                    .setParameter("bookingTime",bookingTime)
                    .getSingleResult();
            return (count > 0);
        }
        finally{
            entityManager.close();
        }
    }

    public boolean saveBooking(Booking booking) {
        EntityManager entityManager = JPAUtil.getEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        try{
            entityTransaction.begin();
            entityManager.persist(booking);
            entityTransaction.commit();
        }catch(Exception e){
            if(entityTransaction.isActive()){
                entityTransaction.rollback();
                throw new RuntimeException("Booking Failed");
            }
        }
        finally {
            entityManager.close();
        }
        return true;
    }

    public List<Booking> getBookingsByUser(Long userId) {
        EntityManager entityManager = JPAUtil.getEntityManager();
        try{
            List<Booking> allBooking = entityManager.createQuery(
                            "FROM Booking WHERE userId = :uid ORDER BY bookingDate DESC", Booking.class)
                                .setParameter("uid", userId)
                                .getResultList();
            return allBooking.isEmpty() ? null : allBooking;
        }
        finally {
            entityManager.close();
        }
    }

    public List<Booking> getBookingsByAdmin() {
        EntityManager entityManager = JPAUtil.getEntityManager();
        try {
            List<Booking> allBookings = entityManager.createQuery(
                            "FROM Booking ORDER BY bookingDate DESC", Booking.class)
                    .getResultList();

            return allBookings.isEmpty() ? null : allBookings;
        } finally {
            entityManager.close();
        }
    }

    public void markCompleted(int bookingId) {
        EntityManager entityManager = JPAUtil.getEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        try{
            entityTransaction.begin();
            Booking booking = entityManager.find(Booking.class, bookingId);
            booking.setStatus(BookingStatus.COMPLETED);
            entityTransaction.commit();
        }catch(Exception e){
            if(entityTransaction.isActive()){
                entityTransaction.rollback();
                throw new RuntimeException("Status Update Failed");
            }
        }
        finally {
            entityManager.close();
        }
    }
}
