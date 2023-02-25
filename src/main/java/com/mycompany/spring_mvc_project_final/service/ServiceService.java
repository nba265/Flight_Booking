package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import com.mycompany.spring_mvc_project_final.repository.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ServiceService {
    @Autowired
    ServiceRepository serviceRepository;

    public List<ServiceEntity> findAll(){
        return(List<ServiceEntity>) serviceRepository.findAll();
    }

    public void save(ServiceEntity serviceEntity){
        serviceRepository.save(serviceEntity);
    }

    public Optional<ServiceEntity> findById(int id){
        return serviceRepository.findById(id);
    }

    public void deleteById(int id){
        serviceRepository.deleteById(id);
    }
}
