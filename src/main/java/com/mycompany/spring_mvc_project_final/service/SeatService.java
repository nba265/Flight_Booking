package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.SeatsEntity;
import com.mycompany.spring_mvc_project_final.repository.SeatRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class SeatService {
    @Autowired
    SeatRepository seatRepository;
    public Optional<SeatsEntity> findByNumber(String number){
        return seatRepository.findByNumber(number);
    }

    public Optional<SeatsEntity> findById(int id){
        return seatRepository.findById(id);
    }

    public Optional<SeatsEntity> findByName(String number){
        return seatRepository.findByNumber(number);
    }
}
