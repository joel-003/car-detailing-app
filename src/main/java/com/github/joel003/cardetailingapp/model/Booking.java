package com.github.joel003.cardetailingapp.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(
        name="bookings",
        uniqueConstraints = @UniqueConstraint(columnNames = {"booking_date","booking_time"})
)
@Data
@AllArgsConstructor
@Builder
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Column(name = "customer_name", nullable = false)
    private String customerName;

    @Column(name = "vehicle_model", nullable = false)
    private String vehicleModel;
    @Column(name = "vehicle_number", nullable = false)
    private String vehicleNumber;

    @Column(name = "package_name", nullable = false)
    private String packageName;
    @Column(nullable = false)
    private double price ;

    @Column(name = "booking_date", nullable = false)
    private LocalDate bookingDate;
    @Column(name = "booking_time", nullable = false)
    private String bookingTime;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private BookingStatus status;

    public Booking(){
        this.status=BookingStatus.CONFIRMED;
    }
}
