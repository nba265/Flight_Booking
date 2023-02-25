package com.mycompany.spring_mvc_project_final.utils;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeatsEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;
import com.mycompany.spring_mvc_project_final.enums.SeatStatusEnum;
import com.mycompany.spring_mvc_project_final.enums.SeatTypeEnum;
import com.mycompany.spring_mvc_project_final.model.Booking;
import com.mycompany.spring_mvc_project_final.service.AircraftSeatService;

import java.util.Optional;

public class AircraftSeatUtils {
    public static double price(String seatStatus){
        if(seatStatus.equals(SeatTypeEnum.ECONOMY.toString())){
            return 30;
        }
        else if(seatStatus.equals(SeatTypeEnum.BUSINESS.toString())){
            return 80;
        }
        else{
            return 50;
        }
    }

    public static AircraftSeatsEntity changeDetail(AircraftSeatsEntity aircraftSeatsEntity1,AircraftSeatsEntity aircraftSeatsEntity2){
        aircraftSeatsEntity1.setPrice(aircraftSeatsEntity2.getPrice());
        aircraftSeatsEntity1.setSeatsStatus(aircraftSeatsEntity2.getSeatsStatus());
        aircraftSeatsEntity1.setSeatsType(aircraftSeatsEntity2.getSeatsType());
        return aircraftSeatsEntity1;
    }

    //----------------------------------

    public static AircraftSeatsEntity lowCostSeatAvailable(AircraftSeatService aircraftSeatService, FlightsEntity flight) {
        double min = Double.MAX_VALUE;
        AircraftSeatsEntity aircraftSeatsEntity = new AircraftSeatsEntity();
        for (AircraftSeatsEntity aircraftSeats : aircraftSeatService.findByFlight(flight)) {
            if (aircraftSeats.getSeatsStatus() == SeatStatusEnum.AVAILABLE) {
                if (min <= aircraftSeats.getPrice()) {
                    min = aircraftSeats.getPrice();
                    aircraftSeatsEntity = aircraftSeats;
                }
            }
        }
        return aircraftSeatsEntity;
    }

    public static void setStatusForSeat(AircraftSeatsEntity aircraftSeats, SeatStatusEnum seatStatusEnum, AircraftSeatService aircraftSeatService) {
        aircraftSeats.setSeatsStatus(seatStatusEnum);
        aircraftSeatService.save(aircraftSeats);
    }

    public static boolean checkIfSeatAvailable(String seat, int flightId, AircraftSeatService aircraftSeatService) {
        return aircraftSeatService.findByFlight_IdAndSeat_Number(flightId, seat).get().getSeatsStatus() == SeatStatusEnum.AVAILABLE;
    }


    public static void setStatusForSeatAfterEndSeesion(AircraftSeatService aircraftSeatService, Booking booking) {
        if (booking.getDepartSeatList() != null) {
            for (String seat : booking.getDepartSeatList()) {
                Optional<AircraftSeatsEntity> aircraftSeats = aircraftSeatService.findByFlight_IdAndSeat_Number(booking.getDepartFlight().getId(), seat);
                if (aircraftSeats.isPresent()){
                    if (aircraftSeats.get().getSeatsStatus() == SeatStatusEnum.PROCESSING) {
                        setStatusForSeat(aircraftSeats.get(), SeatStatusEnum.AVAILABLE, aircraftSeatService);
                    }
                }
                else System.out.println("error");
            }
        }
        if (booking.getFlightAndSeat().ifRoundTrip() && booking.getReturnSeatList() != null) {
            for (String seat : booking.getReturnSeatList()) {
                Optional<AircraftSeatsEntity> aircraftSeats = aircraftSeatService.findByFlight_IdAndSeat_Number(booking.getReturnFlight().getId(), seat);
                if (aircraftSeats.isPresent()){
                    if (aircraftSeats.get().getSeatsStatus() == SeatStatusEnum.PROCESSING) {
                        setStatusForSeat(aircraftSeats.get(), SeatStatusEnum.AVAILABLE, aircraftSeatService);
                    }
                }
                else System.out.println("error");
            }
        }
    }
}

