package com.mycompany.spring_mvc_project_final.model;

import com.mycompany.spring_mvc_project_final.entities.PassengersEntity;

import java.util.List;

public class Passenger {

    private List<PassengersEntity> passengersEntityList;

    public Passenger() {
    }

    public List<PassengersEntity> getPassengersEntityList() {
        return passengersEntityList;
    }

    public void setPassengersEntityList(List<PassengersEntity> passengersEntityList) {
        this.passengersEntityList = passengersEntityList;
    }
}
