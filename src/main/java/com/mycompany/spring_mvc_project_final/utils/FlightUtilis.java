package com.mycompany.spring_mvc_project_final.utils;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeatsEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;
import com.mycompany.spring_mvc_project_final.enums.SeatStatusEnum;
import com.mycompany.spring_mvc_project_final.service.AircraftSeatService;
import com.mycompany.spring_mvc_project_final.service.AircraftService;
import com.mycompany.spring_mvc_project_final.service.FlightService;
import com.mycompany.spring_mvc_project_final.service.FlightsRoutesService;
import org.jetbrains.annotations.TestOnly;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

public class FlightUtilis {
    public static LocalDateTime arrivalDateTime(LocalDate departDate, LocalTime departTime, Duration duration) {
        LocalDateTime dateTimeArrive = LocalDateTime.of(departDate, departTime);
        return dateTimeArrive.plusHours(duration.toHours());
    }

    public static boolean checkDate(FlightsEntity flightsEntity) {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime flight = LocalDateTime.of(flightsEntity.getDeparture(), flightsEntity.getDepartureTime());
        return !flight.isBefore(now);

    }

    public static boolean checkAircraft(FlightsEntity flightsEntity, FlightService flightService, FlightsRoutesService flightsRoutesService, AircraftService aircraftService){
        flightsEntity.setFlightRoute(flightsRoutesService.findById(flightsEntity.getFlightRoute().getId()).get());

        //set arrival datetime

        LocalDateTime arrival= FlightUtilis.arrivalDateTime(flightsEntity.getDeparture(),flightsEntity.getDepartureTime(),flightsEntity.getFlightRoute().getDuration());
        flightsEntity.setArrival(arrival.toLocalDate());
        flightsEntity.setArrivalTime(arrival.toLocalTime());

        //check aircraft
        if(flightsEntity.getId()!=0){
            return true;
        }
        List<FlightsEntity> flightList = (List<FlightsEntity>) flightService.findFlightByNewFlight(flightsEntity);

        for(FlightsEntity flightsEntity1: flightList){
            if(flightsEntity.getAircraft().getId()== flightsEntity1.getAircraft().getId()){
                return false;
            }
        }
        return true;
    }

    //-----------------------------------------------------------------------

    public static FlightsEntity lowCostFlightAvailable(AircraftSeatService aircraftSeatService, List<FlightsEntity> flights) {
        double min = Double.MAX_VALUE;
        FlightsEntity flight = new FlightsEntity();
        for (FlightsEntity flightsEntity : flights) {
            for (AircraftSeatsEntity aircraftSeats : aircraftSeatService.findByFlight(flightsEntity)) {
                if (aircraftSeats.getSeatsStatus() == SeatStatusEnum.AVAILABLE) {
                    if (min >= aircraftSeats.getPrice()) {
                        min = aircraftSeats.getPrice();
                        flight = flightsEntity;
                    }
                }
            }
        }
        return flight;
    }
}
