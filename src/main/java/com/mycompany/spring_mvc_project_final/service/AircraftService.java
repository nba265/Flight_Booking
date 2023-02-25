package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.*;
import com.mycompany.spring_mvc_project_final.enums.SeatStatusEnum;
import com.mycompany.spring_mvc_project_final.repository.AircraftRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class AircraftService {
    @Autowired
    AircraftRepository aircraftRepository;

    public Iterable<AircraftsEntity> findAll(){
        return aircraftRepository.findAll();
    }

    public Optional<AircraftsEntity> findById(int id){
        return aircraftRepository.findById(id);
    }

    public void save(AircraftsEntity aircraftsEntity){
        aircraftRepository.save(aircraftsEntity);
    }

    public void deleteById(int id){
        aircraftRepository.deleteById(id);
    }

}
