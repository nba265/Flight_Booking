package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeatsEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;
import com.mycompany.spring_mvc_project_final.entities.SeatsEntity;
import com.mycompany.spring_mvc_project_final.repository.AircraftSeatsRepository;
import com.mycompany.spring_mvc_project_final.repository.SeatRepository;
import com.mycompany.spring_mvc_project_final.utils.SeatUtilis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

@Service
public class AircraftSeatService {

    @Autowired
    AircraftSeatsRepository aircraftSeatsRepository;

    @Autowired
    SeatRepository seatRepository;


    public void save(AircraftSeatsEntity aircraftSeatsEntity){
        aircraftSeatsRepository.save(aircraftSeatsEntity);
    }

    public Optional<AircraftSeatsEntity> findBySeatNumberAndFlight(String number,int id){
        return aircraftSeatsRepository.findBySeat_NumberAndFlight_Id(number,id);
    }

    public Optional<AircraftSeatsEntity> findByFlight_IdAndSeat_Number(int flightId, String seatNumber){
        return aircraftSeatsRepository.findByFlight_IdAndSeat_Number(flightId,seatNumber);
    }

    public Optional<AircraftSeatsEntity> findById(int id){
        return aircraftSeatsRepository.findById(id);
    }
    public List<AircraftSeatsEntity> save(int row, int col) {
        List<AircraftSeatsEntity> aircraftSeatsEntities = new ArrayList<>();
        List<AircraftSeatsEntity> aircraftSeatsCol;
        AircraftSeatsEntity aircraftSeatsEntity;
        StringBuilder stringBuilder;
        SeatsEntity seatsEntity;



        //get list seat


        List<String> seatsEntityList = new ArrayList<>();
        for (SeatsEntity value : seatRepository.findAll()) {
            seatsEntityList.add(value.getNumber());
        }


        for (int j = 1; j <= row; j++) {
            aircraftSeatsCol = new ArrayList<>();
            for (int i = 1; i <= col; i++) {
                aircraftSeatsEntity = new AircraftSeatsEntity();
                stringBuilder = new StringBuilder();
                seatsEntity = new SeatsEntity();

                //create seat entity


                stringBuilder.append(j).append(SeatUtilis.getCharForNumber(i));
                seatsEntity.setNumber(String.valueOf(stringBuilder));
                if (!seatsEntityList.contains(String.valueOf(stringBuilder))) {
                    seatRepository.save(seatsEntity);
                }
                aircraftSeatsEntity.setSeat(seatRepository.findByNumber(seatsEntity.getNumber()).get());
                aircraftSeatsCol.add(aircraftSeatsEntity);
            }
            aircraftSeatsEntities.addAll(aircraftSeatsCol);
        }
        return aircraftSeatsEntities;
    }

    public Iterable<AircraftSeatsEntity> findByFlight(FlightsEntity flight){
        return aircraftSeatsRepository.findByFlight(flight);
    }

}
