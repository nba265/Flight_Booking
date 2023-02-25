package com.mycompany.spring_mvc_project_final.entities;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "seats")
public class SeatsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Column(name = "number", length = 3)
    private String number;

    @OneToMany(mappedBy = "seatsEntity", fetch = FetchType.LAZY)
    private List<BookingDetailEntity> bookingDetailEntities;

    @OneToMany(mappedBy = "seat", fetch = FetchType.LAZY)
    private List<AircraftSeatsEntity> aircraftSeatsEntityList;

    public SeatsEntity() {
    }

    public List<AircraftSeatsEntity> getAircraftSeatsEntityList() {
        return aircraftSeatsEntityList;
    }

    public void setAircraftSeatsEntityList(List<AircraftSeatsEntity> aircraftSeatsEntityList) {
        this.aircraftSeatsEntityList = aircraftSeatsEntityList;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<BookingDetailEntity> getBookingDetailEntities() {
        return bookingDetailEntities;
    }

    public void setBookingDetailEntities(List<BookingDetailEntity> bookingDetailEntities) {
        this.bookingDetailEntities = bookingDetailEntities;
    }
}
