package com.mycompany.spring_mvc_project_final.model;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeatsEntity;
import org.springframework.beans.factory.annotation.Autowired;

public class FlightAndSeat {

    @Autowired
    AircraftSeatsEntity aircraftSeats;

    private int departFlightId;

    private String departSeatType;

    private int returnFlightId;

    private String returnSeatType;

    private int quantity;

    public FlightAndSeat() {
    }

    public AircraftSeatsEntity getAircraftSeats() {
        return aircraftSeats;
    }

    public void setAircraftSeats(AircraftSeatsEntity aircraftSeats) {
        this.aircraftSeats = aircraftSeats;
    }

    public int getDepartFlightId() {
        return departFlightId;
    }

    public void setDepartFlightId(int departFlightId) {
        this.departFlightId = departFlightId;
    }

    public String getDepartSeatType() {
        return departSeatType;
    }

    public void setDepartSeatType(String departSeatType) {
        this.departSeatType = departSeatType;
    }

    public int getReturnFlightId() {
        return returnFlightId;
    }

    public void setReturnFlightId(int returnFlightId) {
        this.returnFlightId = returnFlightId;
    }

    public String getReturnSeatType() {
        return returnSeatType;
    }

    public void setReturnSeatType(String returnSeatType) {
        this.returnSeatType = returnSeatType;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean ifRoundTrip() {
        return returnFlightId != 0;
    }
}
