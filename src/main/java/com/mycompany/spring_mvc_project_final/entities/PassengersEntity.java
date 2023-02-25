package com.mycompany.spring_mvc_project_final.entities;

import org.hibernate.annotations.*;
import org.springframework.data.jpa.repository.Query;

import javax.persistence.*;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.List;

@Entity
@Table(name = "passengers")
public class PassengersEntity extends Personal {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="identity_code")
	private String idenCode;


	@OneToMany(mappedBy = "passengersEntity",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	@Fetch(FetchMode.SUBSELECT)
	private List<BookingDetailEntity> bookingDetailEntities;

	public PassengersEntity() {
	}

	public String getIdenCode() {
		return idenCode;
	}

	public void setIdenCode(String idenCode) {
		this.idenCode = idenCode;
	}

	public List<BookingDetailEntity> getBookingDetailEntities() {
		return bookingDetailEntities;
	}

	public void setBookingDetailEntities(List<BookingDetailEntity> bookingDetailEntities) {
		this.bookingDetailEntities = bookingDetailEntities;
	}

}
