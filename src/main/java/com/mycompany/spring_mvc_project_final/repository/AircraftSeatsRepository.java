package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.AircraftSeatsEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AircraftSeatsRepository extends CrudRepository<AircraftSeatsEntity,Integer> {
    Optional<AircraftSeatsEntity> findBySeat_NumberAndFlight_Id(String number,int id);

    Optional<AircraftSeatsEntity> findBySeat_Number(String seat_number);

    Optional<AircraftSeatsEntity> findByFlight_IdAndSeat_Number(int flight_id, String seat_number);

    Optional<AircraftSeatsEntity> findByFlight_IdAndSeat_Id(int flight_id, int seat_id);

    Iterable<AircraftSeatsEntity> findByFlight(FlightsEntity flight);
}
