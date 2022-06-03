package com.example.demo.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;

@Entity
@Table (name="registrationn")

public class Regis {
	
	@Id
	int userId
	
	@Column
	 String firstName;
	
	@Column
	 String lastName;
	
	@Column
	 String email;
	
	@Column
	 String password;
	
	@Column
	 String contactNumber;
	
	@Column
	 String address;
	
	@Column
	 String gender;
	
	@Column
	 String gstNumber;
	
	@Column
	 String businessName;
	
	@Column
	 String userType;

}
