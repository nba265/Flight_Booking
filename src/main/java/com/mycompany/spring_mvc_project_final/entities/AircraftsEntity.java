package com.mycompany.spring_mvc_project_final.entities;


import com.mycompany.spring_mvc_project_final.enums.AircrartsStatusEnum;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "aircrafts")
public class AircraftsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "number", length = 20)
    private String number;

    @Column(name = "row_seat")
    private Integer row;

    @Column(name = "col_seat")
    private Integer col;


    @Enumerated(EnumType.STRING)
    private AircrartsStatusEnum aircraftStatus;

    @OneToMany(mappedBy = "aircraft", fetch = FetchType.LAZY)
    @Fetch(FetchMode.SUBSELECT)
    private List<AircraftSeatsEntity> aircraftSeatList;

    @OneToMany(mappedBy = "aircraft", fetch = FetchType.LAZY)
    @Fetch(FetchMode.SUBSELECT)
    private List<FlightsEntity> flightsList;

    public AircraftsEntity() {
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

    public AircrartsStatusEnum getAircraftStatus() {
        return aircraftStatus;
    }

    public void setAircraftStatus(AircrartsStatusEnum aircraftStatus) {
        this.aircraftStatus = aircraftStatus;
    }

    public List<AircraftSeatsEntity> getAircraftSeatList() {
        return aircraftSeatList;
    }

    public void setAircraftSeatList(List<AircraftSeatsEntity> aircraftSeatList) {
        this.aircraftSeatList = aircraftSeatList;
    }

    public List<FlightsEntity> getFlightsList() {
        return flightsList;
    }

    public void setFlightsList(List<FlightsEntity> flightsList) {
        this.flightsList = flightsList;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Integer getRow() {
        return row;
    }

    public void setRow(Integer row) {
        this.row = row;
    }

    public Integer getCol() {
        return col;
    }

    public void setCol(Integer col) {
        this.col = col;
    }
}
