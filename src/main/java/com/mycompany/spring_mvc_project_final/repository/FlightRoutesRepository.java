package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.FlightRoutesEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface FlightRoutesRepository extends CrudRepository<FlightRoutesEntity,Integer> {
    @Query(value = "select f from FlightRoutesEntity f where f.departureAirport.name =?1 and f.destinationAirport.name =?2")
     Optional<FlightRoutesEntity> findByCriteria(String departure, String destination);
     Iterable<FlightRoutesEntity> findAll();

     Iterable<FlightRoutesEntity> findByDepartureAirport_Id(int departureAirport_id);
     Iterable<FlightRoutesEntity> findByDestinationAirport_Id(int destinationAirport_id);
}
