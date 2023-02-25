package com.mycompany.spring_mvc_project_final.entities;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;

@Entity
@Table(name = "service_booking")
public class ServiceBookingEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private int quantity;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "booking_detail_id")
	private BookingDetailEntity bookingDetailEntity;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "service_id")
	private ServiceEntity serviceEntity;


	public ServiceBookingEntity() {
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public BookingDetailEntity getBookingDetailEntity() {
		return bookingDetailEntity;
	}

	public void setBookingDetailEntity(BookingDetailEntity bookingDetailEntity) {
		this.bookingDetailEntity = bookingDetailEntity;
	}

	public ServiceEntity getServiceEntity() {
		return serviceEntity;
	}

	public void setServiceEntity(ServiceEntity serviceEntity) {
		this.serviceEntity = serviceEntity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


}
