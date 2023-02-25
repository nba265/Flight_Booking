package com.mycompany.spring_mvc_project_final.entities;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "airports")
public class AirportsEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

	private String code;

	@OneToMany(mappedBy = "airport",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@Fetch(FetchMode.SUBSELECT)
	private List<ImageEntity> imageList;

	@OneToMany(mappedBy = "departureAirport",fetch = FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private List<FlightRoutesEntity> flightRoutesList1;

	@OneToMany(mappedBy = "destinationAirport",fetch = FetchType.EAGER)
	@Fetch(FetchMode.SUBSELECT)
	private List<FlightRoutesEntity> flightRoutesList2;

	public AirportsEntity() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<ImageEntity> getImageList() {
		return imageList;
	}

	public void setImageList(List<ImageEntity> imageList) {
		this.imageList = imageList;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public List<FlightRoutesEntity> getFlightRoutesList1() {
		return flightRoutesList1;
	}

	public void setFlightRoutesList1(List<FlightRoutesEntity> flightRoutesList1) {
		this.flightRoutesList1 = flightRoutesList1;
	}

	public List<FlightRoutesEntity> getFlightRoutesList2() {
		return flightRoutesList2;
	}

	public void setFlightRoutesList2(List<FlightRoutesEntity> flightRoutesList2) {
		this.flightRoutesList2 = flightRoutesList2;
	}


}
