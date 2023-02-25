package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.PaymentEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;

@Repository
public interface PaymentRepository extends CrudRepository<PaymentEntity,Integer> {

    @Query(value = "select sum(amount) from payment",nativeQuery = true)
    Double sum();
    @Query(value = "select sum(p.amount) FROM PaymentEntity p WHERE p.paymentDate BETWEEN ?1 AND ?2")
    Double getSumIncome(LocalDate startDate, LocalDate endDate);
}
