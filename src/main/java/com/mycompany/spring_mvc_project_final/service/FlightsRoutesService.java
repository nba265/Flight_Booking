package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.FlightRoutesEntity;
import com.mycompany.spring_mvc_project_final.repository.FlightRoutesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FlightsRoutesService {
    @Autowired
    FlightRoutesRepository flightRoutesRepository;

    @Autowired
    AirportService airportService;

    public void save(FlightRoutesEntity flightRoutesEntity){
        flightRoutesRepository.save(flightRoutesEntity);
    }

    public Iterable<FlightRoutesEntity> findAll(){
        return flightRoutesRepository.findAll();
    }

    public Optional<FlightRoutesEntity> findById(int id){
        return flightRoutesRepository.findById(id);
    }

    public void deleteById(int id){
        flightRoutesRepository.deleteById(id);
    }

    public Optional<FlightRoutesEntity> findByCriteria(String departure, String destination){
        return flightRoutesRepository.findByCriteria(departure,destination);
    }

    public List<FlightRoutesEntity> findByDepartureAirport_Id(int id){
        return (List<FlightRoutesEntity>) flightRoutesRepository.findByDepartureAirport_Id(id);
    }

    public List<FlightRoutesEntity> findByDestinationAirport_Id(int id){
        return (List<FlightRoutesEntity>) flightRoutesRepository.findByDestinationAirport_Id(id);
    }

}
