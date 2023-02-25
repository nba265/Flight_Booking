package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.FeeAndCarrierChargesEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface FeeRepository extends CrudRepository<FeeAndCarrierChargesEntity,Integer> {
    public Optional<FeeAndCarrierChargesEntity> findByName(String name);
}
