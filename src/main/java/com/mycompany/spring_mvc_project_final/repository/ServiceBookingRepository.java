package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ServiceBookingRepository extends CrudRepository<ServiceBookingEntity,Integer> {

    Iterable<ServiceBookingEntity> findByBookingDetailEntity(BookingDetailEntity bookingDetailEntity);

    @Modifying
    @Query(value = "delete from ServiceBookingEntity s where s.bookingDetailEntity.id = ?1 ")
    void deleteByBookingDetailEntity_Id(int bookingDetailEntity_id);

}
