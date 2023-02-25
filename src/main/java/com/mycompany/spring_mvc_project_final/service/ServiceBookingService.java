package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import com.mycompany.spring_mvc_project_final.repository.ServiceBookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class ServiceBookingService {
    @Autowired
    ServiceBookingRepository serviceBookingRepository;

    public List<ServiceBookingEntity> findByBookingDetailEntity(BookingDetailEntity bookingDetailEntity){
        return (List<ServiceBookingEntity>) serviceBookingRepository.findByBookingDetailEntity(bookingDetailEntity);

    }
    public void save(ServiceBookingEntity serviceBookingEntity){
        serviceBookingRepository.save(serviceBookingEntity);
    }
    public void deleteById(BookingDetailEntity bookingDetailEntities){
        serviceBookingRepository.deleteByBookingDetailEntity_Id(bookingDetailEntities.getId());
    }
}
