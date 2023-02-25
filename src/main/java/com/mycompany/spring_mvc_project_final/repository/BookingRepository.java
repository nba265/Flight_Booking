package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface BookingRepository extends CrudRepository<BookingEntity,Integer> {

    Iterable<BookingEntity> findByBookingDateBetween(LocalDate startDate, LocalDate endDate);

    Iterable<BookingEntity> findByBookingDateBetweenAndUserEntity_Id(LocalDate bookingDate, LocalDate bookingDate2, Integer userEntity_id);

    @Query(value = "Select count(id) from booking ",nativeQuery = true)
   long countAll();

    long countByBookingDateEquals(LocalDate localDate);

    @Query(value = "select b.bookingNumber from BookingEntity b")
     List<String> findAllBookingNumber();

    Iterable<BookingEntity> findByUserEntity_Id(Integer userEntity_id);

    Optional<BookingEntity> findByBookingNumber(String bookingNumber);
}
