package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.AirportsEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;


@Repository
public interface AirportRepository extends CrudRepository<AirportsEntity, Integer> {
     Optional<AirportsEntity> findByCode(String code);

}
