package com.mycompany.spring_mvc_project_final.entities;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "service")
public class ServiceEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    private String description;

    private double price;

    @OneToMany(mappedBy = "serviceEntity", fetch = FetchType.LAZY,cascade = CascadeType.ALL)
    private List<ServiceBookingEntity> serviceBookingEntities;

    @OneToMany(mappedBy = "service", fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    private List<ImageEntity> imageEntities;

    public ServiceEntity() {
    }

    public List<ServiceBookingEntity> getServiceBookingEntities() {
        return serviceBookingEntities;
    }

    public void setServiceBookingEntities(List<ServiceBookingEntity> serviceBookingEntities) {
        this.serviceBookingEntities = serviceBookingEntities;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public List<ImageEntity> getImageEntities() {
        return imageEntities;
    }

    public void setImageEntities(List<ImageEntity> imageEntities) {
        this.imageEntities = imageEntities;
    }

}
