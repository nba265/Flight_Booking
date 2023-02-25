package com.mycompany.spring_mvc_project_final.entities;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.Duration;
import java.time.LocalTime;
import java.util.List;

@Entity
@Table(name = "flight_routes")
public class FlightRoutesEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @DateTimeFormat(pattern = "HH:mm:ss")
    private Duration duration;

    private double standardPrice;

    private Double distance;

    @ManyToOne
    @JoinColumn(name = "departure_id")
    private AirportsEntity departureAirport;

    @ManyToOne
    @JoinColumn(name = "destination_id")
    private AirportsEntity destinationAirport;

    @OneToMany(mappedBy = "flightRoute",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @Fetch(FetchMode.SUBSELECT)
    private List<FlightsEntity> flightList;

    public FlightRoutesEntity() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Duration getDuration() {
        return duration;
    }

    public void setDuration(Duration duration) {
        this.duration = duration;
    }

    public double getStandardPrice() {
        return standardPrice;
    }

    public void setStandardPrice(double standardPrice) {
        this.standardPrice = standardPrice;
    }

    public Double getDistance() {
        return distance;
    }

    public void setDistance(Double distance) {
        this.distance = distance;
    }

    public AirportsEntity getDepartureAirport() {
        return departureAirport;
    }

    public void setDepartureAirport(AirportsEntity departureAirport) {
        this.departureAirport = departureAirport;
    }

    public AirportsEntity getDestinationAirport() {
        return destinationAirport;
    }

    public void setDestinationAirport(AirportsEntity destinationAirport) {
        this.destinationAirport = destinationAirport;
    }

    public List<FlightsEntity> getFlightList() {
        return flightList;
    }

    public void setFlightList(List<FlightsEntity> flightList) {
        this.flightList = flightList;
    }

}
