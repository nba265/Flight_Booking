package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingDetailRepository extends CrudRepository<BookingDetailEntity,Integer> {
    Iterable<BookingDetailEntity> findByBookingEntity_Id(int id);

    Iterable<BookingDetailEntity> findByBookingEntity_BookingNumber(String bookingEntity_bookingNumber);

    Iterable<BookingDetailEntity> findByBookingEntity(BookingEntity bookingEntity);
}
