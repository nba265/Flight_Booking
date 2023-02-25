package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.BookingStatusEnum;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="booking_detail")
public class BookingDetailEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private double unitPrice;

    private double discount;

    @Enumerated(EnumType.STRING)
    private BookingStatusEnum bookingStatusEnum;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "seat_id")
    private SeatsEntity seatsEntity;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "fight_id")
    private FlightsEntity flightsEntity;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "passenger_id")
    private PassengersEntity passengersEntity;

    @ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    @JoinColumn(name = "booking_id")
    private BookingEntity bookingEntity;


    @OneToMany(mappedBy = "bookingDetailEntity",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    private List<ServiceBookingEntity> serviceBookingEntities;

    public BookingDetailEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public SeatsEntity getSeatsEntity() {
        return seatsEntity;
    }

    public void setSeatsEntity(SeatsEntity seatsEntity) {
        this.seatsEntity = seatsEntity;
    }

    public FlightsEntity getFlightsEntity() {
        return flightsEntity;
    }

    public void setFlightsEntity(FlightsEntity flightsEntity) {
        this.flightsEntity = flightsEntity;
    }

    public PassengersEntity getPassengersEntity() {
        return passengersEntity;
    }

    public void setPassengersEntity(PassengersEntity passengersEntity) {
        this.passengersEntity = passengersEntity;
    }

    public BookingEntity getBookingEntity() {
        return bookingEntity;
    }

    public void setBookingEntity(BookingEntity bookingEntity) {
        this.bookingEntity = bookingEntity;
    }

    public List<ServiceBookingEntity> getServiceBookingEntities() {
        return serviceBookingEntities;
    }

    public void setServiceBookingEntities(List<ServiceBookingEntity> serviceBookingEntities) {
        this.serviceBookingEntities = serviceBookingEntities;
    }

    public BookingStatusEnum getBookingStatusEnum() {
        return bookingStatusEnum;
    }

    public void setBookingStatusEnum(BookingStatusEnum bookingStatusEnum) {
        this.bookingStatusEnum = bookingStatusEnum;
    }
}

