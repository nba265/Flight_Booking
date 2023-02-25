package com.mycompany.spring_mvc_project_final.entities;


import com.mycompany.spring_mvc_project_final.enums.SeatStatusEnum;
import com.mycompany.spring_mvc_project_final.enums.SeatTypeEnum;

import javax.persistence.*;

@Entity
@Table(name = "aircraft_seats")
public class AircraftSeatsEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private double price;

    @Enumerated(EnumType.STRING)
    private SeatTypeEnum seatsType;

    @ManyToOne
    @JoinColumn(name = "flight_id")
    private FlightsEntity flight;

    @Enumerated(EnumType.STRING)
    private SeatStatusEnum seatsStatus;

    @ManyToOne
    @JoinColumn(name = "seat_id")
    private SeatsEntity seat;

    @ManyToOne
    @JoinColumn(name = "aircraft_id")
    private AircraftsEntity aircraft;

    public AircraftSeatsEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public SeatTypeEnum getSeatsType() {
        return seatsType;
    }

    public void setSeatsType(SeatTypeEnum seatsType) {
        this.seatsType = seatsType;
    }

    public FlightsEntity getFlight() {
        return flight;
    }

    public void setFlight(FlightsEntity flight) {
        this.flight = flight;
    }

    public SeatStatusEnum getSeatsStatus() {
        return seatsStatus;
    }

    public void setSeatsStatus(SeatStatusEnum seatsStatus) {
        this.seatsStatus = seatsStatus;
    }

    public SeatsEntity getSeat() {
        return seat;
    }

    public void setSeat(SeatsEntity seat) {
        this.seat = seat;
    }

    public AircraftsEntity getAircraft() {
        return aircraft;
    }

    public void setAircraft(AircraftsEntity aircraft) {
        this.aircraft = aircraft;
    }

    @Override
    public String toString() {
        return "AircraftSeatsEntity{" +
                "id=" + id +
                ", price=" + price +
                ", seatsType=" + seatsType.name() +
                ", flight=" + flight.getId() +
                ", seatsStatus=" + seatsStatus.name() +
                ", seat=" + seat.getNumber() +
                ", aircraft=" + aircraft.getNumber() +
                '}';
    }

}
