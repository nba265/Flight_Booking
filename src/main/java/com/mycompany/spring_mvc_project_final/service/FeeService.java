package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.FeeAndCarrierChargesEntity;
import com.mycompany.spring_mvc_project_final.repository.FeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class FeeService {
    @Autowired
    FeeRepository feeRepository;

    public Optional<FeeAndCarrierChargesEntity> findByName(String name){
        return feeRepository.findByName(name);
    }

    public Iterable<FeeAndCarrierChargesEntity> findAll(){
        return feeRepository.findAll();
    }
}
