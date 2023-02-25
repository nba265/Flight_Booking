package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.*;
import com.mycompany.spring_mvc_project_final.enums.AircrartsStatusEnum;
import com.mycompany.spring_mvc_project_final.enums.SeatStatusEnum;
import com.mycompany.spring_mvc_project_final.enums.SeatTypeEnum;
import com.mycompany.spring_mvc_project_final.repository.FlightRepository;
import com.mycompany.spring_mvc_project_final.utils.AircraftSeatUtils;
import com.mycompany.spring_mvc_project_final.utils.FlightUtilis;
import com.mycompany.spring_mvc_project_final.utils.PromotionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Access;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@Service
public class FlightService {
    @Autowired
    FlightRepository flightRepository;

    @Autowired
    FlightsRoutesService flightsRoutesService;

    @Autowired
    AircraftSeatService aircraftSeatService;

    @Autowired
    AircraftService aircraftService;

    @Autowired
    PromotionService promotionService;


    public Iterable<FlightsEntity> findAll(){
        return flightRepository.findAll();
    }

    public Optional<FlightsEntity> findById(int id){
        return flightRepository.findById(id);
    }

    public void deleteById(int id){

        flightRepository.deleteById(id);
    }

    public List<FlightsEntity> findAllByFlightRouteAndDeparture(FlightRoutesEntity flightRoute, LocalDate departure) {
        return (List<FlightsEntity>) flightRepository.findByFlightRouteAndDeparture(flightRoute, departure);
    }

    public List<FlightsEntity> findAvailableFlight(List<FlightsEntity> flightsEntities) {
        List<FlightsEntity> availableFlight = new ArrayList<>();
        for (FlightsEntity flight : flightsEntities) {
            if (flight.getAircraft().getAircraftStatus() == AircrartsStatusEnum.ACTIVE && flight.getDeparture().isAfter(LocalDate.now())) {
                for (AircraftSeatsEntity seat : flight.getAircraftSeatsList()) {
                    if(seat.getSeatsStatus() == SeatStatusEnum.AVAILABLE){
                        availableFlight.add(flight);
                        break;
                    }
                }
            }
        }
        return availableFlight;
    }

    @Transactional(rollbackFor = Exception.class)
    public void save(FlightsEntity flightsEntity,String[] strings) throws Exception{
        try {
            flightsEntity.setAircraft(aircraftService.findById(flightsEntity.getAircraft().getId()).get());
            AircraftsEntity aircraftsEntity = aircraftService.findById(flightsEntity.getAircraft().getId()).get();
            flightsEntity.setPromotionEntities(new HashSet<>());
            PromotionUtils.saveById(strings, flightsEntity, promotionService);

            //save Seat and get Aircraft Seat list
            List<AircraftSeatsEntity> aircraftSeatsEntityList = aircraftSeatService.save(aircraftsEntity.getRow(), aircraftsEntity.getCol());
            flightsEntity.setAircraftSeatsList(aircraftSeatsEntityList);
            flightRepository.save(flightsEntity);

            // save AirCraft Seat
            int row = aircraftsEntity.getRow();
            for (AircraftSeatsEntity entity : aircraftSeatsEntityList) {
                entity.setFlight(flightsEntity);
                String temp = entity.getSeat().getNumber();
                int row1 = Integer.parseInt(temp.subSequence(0, temp.length() - 1).toString());
                if (row1 <= (row / 3)) {
                    entity.setSeatsType(SeatTypeEnum.BUSINESS);
                } else if (row1 <= ((row / 3) * 2)) {
                    entity.setSeatsType(SeatTypeEnum.FIRST_CLASS);
                } else {
                    entity.setSeatsType(SeatTypeEnum.ECONOMY);
                }
                entity.setPrice(AircraftSeatUtils.price(entity.getSeatsType().name()));
                entity.setSeatsStatus(SeatStatusEnum.AVAILABLE);
                entity.setAircraft(flightsEntity.getAircraft());
                aircraftSeatService.save(entity);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<FlightsEntity> findFlightlistByBookingDetails(BookingEntity bookingEntity,BookingDetailService bookingDetailService){
        List<FlightsEntity> flightsEntityList = new ArrayList<>();
        int id= -1;
        List<BookingDetailEntity> BookingDetailEntities = (List<BookingDetailEntity>) bookingDetailService.findByBooking(bookingEntity);
        for (BookingDetailEntity bookingDetail:BookingDetailEntities) {
            if(bookingDetail.getFlightsEntity().getId()!=id){
                flightsEntityList.add(bookingDetail.getFlightsEntity());
            }
            id=bookingDetail.getFlightsEntity().getId();
        }
        return flightsEntityList;
    }


    public Optional<FlightsEntity> findByFlightRouteLowCost(Integer departureId,Integer destinationId){
        return flightRepository.findByFlightRouteLowCost(departureId,destinationId);
    }

    public List<FlightsEntity> findByFlightRoute_Id(int id){
        return (List<FlightsEntity>) flightRepository.findByFlightRoute_Id(id);
    }

    public Iterable<FlightsEntity> findFlightByNewFlight(FlightsEntity flightsEntity){
        LocalDateTime start= LocalDateTime.of(flightsEntity.getDeparture(),flightsEntity.getDepartureTime());
        LocalDateTime end = LocalDateTime.of(flightsEntity.getArrival(),flightsEntity.getArrivalTime());
        return flightRepository.findFlightByNewFlight(Timestamp.valueOf(start),Timestamp.valueOf(end));
    }
}
