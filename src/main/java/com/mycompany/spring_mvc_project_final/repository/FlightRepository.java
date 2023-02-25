package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.FlightRoutesEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightsEntity;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.Optional;

@Repository
public interface FlightRepository extends CrudRepository<FlightsEntity,Integer> {

   /* @Query(value = "select f from FlightsEntity f where f.flightRoute = ?1 and f.departure = ?2")*/
    Iterable<FlightsEntity> findByFlightRouteAndDeparture(FlightRoutesEntity flightRoute, LocalDate departure);

    Iterable<FlightsEntity> findByFlightRoute_Id(Integer flightRoute_id);

    Iterable<FlightsEntity> findAll();

    @Query(value = "select f.* from flight f join flight_routes fr " +
            "on f.flight_route_id = fr.id " +
            "join aircraft_seats a on f.id = a.flight_id " +
            "where (fr.departure_id = ?1 and fr.destination_id = ?2 and a.seatsStatus = 'AVAILABLE') " +
            "order by a.price asc limit 1;",nativeQuery = true)
    Optional<FlightsEntity> findByFlightRouteLowCost(Integer departure_id,Integer destination_id);

 @Query(value = "select * from flight where (timestamp(arrival,arrivalTime) between ?1 and ?2) or (timestamp(departure,departureTime) between ?1 and ?2) or ((timestamp(departure,departureTime) <= ?1)and(timestamp(arrival,arrivalTime) >= ?2)) ",nativeQuery = true)
 Iterable<FlightsEntity> findFlightByNewFlight(Timestamp start, Timestamp end);
}
