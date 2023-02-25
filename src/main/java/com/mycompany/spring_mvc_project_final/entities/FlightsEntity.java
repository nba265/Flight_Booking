package com.mycompany.spring_mvc_project_final.entities;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Set;

@Entity
@Table(name="flight")
public class FlightsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate departure;

    @DateTimeFormat(pattern = "HH:mm")
    private LocalTime departureTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate arrival;

    @DateTimeFormat(pattern = "HH:mm")
    private LocalTime arrivalTime;

    @ManyToOne
    @JoinColumn(name = "flight_route_id")
    private FlightRoutesEntity flightRoute;

    @ManyToOne
    @JoinColumn(name = "aircaft_id")
    private AircraftsEntity aircraft;

    @OneToMany(mappedBy = "flight" , fetch = FetchType.EAGER)
    @Fetch(FetchMode.SUBSELECT)
    private List<AircraftSeatsEntity> aircraftSeatsList;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "flight_promotion",joinColumns =@JoinColumn(name = "id_flight",referencedColumnName = "id") ,inverseJoinColumns = @JoinColumn(name = "id_promotion", referencedColumnName = "id"))
    @Fetch(FetchMode.SUBSELECT)
    private Set<PromotionEntity> promotionEntities;

    @OneToMany(mappedBy = "flightsEntity", fetch = FetchType.LAZY)
    private List<BookingDetailEntity> bookingDetailEntities;
    public FlightsEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDate getDeparture() {
        return departure;
    }

    public void setDeparture(LocalDate departure) {
        this.departure = departure;
    }

    public LocalTime getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(LocalTime departureTime) {
        this.departureTime = departureTime;
    }

    public LocalDate getArrival() {
        return arrival;
    }

    public void setArrival(LocalDate arrival) {
        this.arrival = arrival;
    }

    public LocalTime getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(LocalTime arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public FlightRoutesEntity getFlightRoute() {
        return flightRoute;
    }

    public void setFlightRoute(FlightRoutesEntity flightRoute) {
        this.flightRoute = flightRoute;
    }

    public AircraftsEntity getAircraft() {
        return aircraft;
    }

    public void setAircraft(AircraftsEntity aircraft) {
        this.aircraft = aircraft;
    }

    public List<AircraftSeatsEntity> getAircraftSeatsList() {
        return aircraftSeatsList;
    }

    public void setAircraftSeatsList(List<AircraftSeatsEntity> aircraftSeatsList) {
        this.aircraftSeatsList = aircraftSeatsList;
    }

    public Set<PromotionEntity> getPromotionEntities() {
        return promotionEntities;
    }

    public void setPromotionEntities(Set<PromotionEntity> promotionEntities) {
        this.promotionEntities = promotionEntities;
    }

    public List<BookingDetailEntity> getBookingDetailEntities() {
        return bookingDetailEntities;
    }

    public void setBookingDetailEntities(List<BookingDetailEntity> bookingDetailEntities) {
        this.bookingDetailEntities = bookingDetailEntities;
    }

}
