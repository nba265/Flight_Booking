package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class BookingService {
    @Autowired
    BookingRepository bookingRepository;

    public Iterable<BookingEntity> findAll(LocalDate startDate, LocalDate endDate){
        if(startDate== null && endDate==null){
            return bookingRepository.findAll();
        }
        return bookingRepository.findByBookingDateBetween(startDate, endDate);
    }

    public Optional<BookingEntity> findById(int id){
        return  bookingRepository.findById(id);
    }

    @Transactional(rollbackFor = Exception.class)
    public void save(BookingEntity bookingEntity){
        try {
            bookingRepository.save(bookingEntity);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<String> findAllBookingNumber(){
        return bookingRepository.findAllBookingNumber();
    }

    public long countAll(){
        return bookingRepository.countAll();
    }
    public long newBooking(){
        return bookingRepository.countByBookingDateEquals(LocalDate.now());
    }

    public Iterable<BookingEntity> findByUserEntity_Id(Integer userEntity_id){
        return bookingRepository.findByUserEntity_Id(userEntity_id);
    }

    public Iterable<BookingEntity> findByBookingDateBetweenAndUserEntity_Id(LocalDate startDate, LocalDate endDate,Integer userEntity_id){
        if(startDate== null && endDate==null){
            return bookingRepository.findByUserEntity_Id(userEntity_id);
        }
        return bookingRepository.findByBookingDateBetweenAndUserEntity_Id(startDate, endDate,userEntity_id);
    }

    public Optional<BookingEntity> findByBookingNumber(String bookingNumber){
        return bookingRepository.findByBookingNumber(bookingNumber);
    }


}
