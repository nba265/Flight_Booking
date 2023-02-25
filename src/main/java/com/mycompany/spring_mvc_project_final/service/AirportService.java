package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AirportsEntity;
import com.mycompany.spring_mvc_project_final.repository.AirportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AirportService {
    @Autowired
    AirportRepository airportRepository;

    public Iterable<AirportsEntity> findAll(){
        return airportRepository.findAll();
    };

    public Optional<AirportsEntity> findById(int id){
        return airportRepository.findById(id);
    }

    public void save(AirportsEntity airportsEntity){
        airportRepository.save(airportsEntity);
    }

    public void deleteById(int id){
        airportRepository.deleteById(id);
    }

    public Optional<AirportsEntity> findByCode(String code){
        return airportRepository.findByCode(code);
    }

}
