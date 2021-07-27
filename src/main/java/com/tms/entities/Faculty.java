package com.tms.entities;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="faculty")
public class Faculty {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "faculty_id")
	private Long facultyId;
	
	@Column(name = "faculty_name")
	private String facultyName;

	@Column(name = "faculty_address")
	private String facultyAddress;

	@Column(name = "faculty_dob")
	private Date facultyDOB;

	@Column(name = "faculty_email")
	private String facultyEmail;

	@Column(name = "faculty_contact")
	private String facultyContact;

	@Column(name = "faulty_class_name")
	private String faultyClassName;

	@Column(name = "faculty_date_of_joning")
	private Date facultyDateOfJoning;

	@Column(name = "faculty_photo")
	private Byte facultyPhoto;

	public Long getFacultyId() {
		return facultyId;
	}

	public void setFacultyId(Long facultyId) {
		this.facultyId = facultyId;
	}

	public String getFacultyName() {
		return facultyName;
	}

	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}

	public String getFacultyAddress() {
		return facultyAddress;
	}

	public void setFacultyAddress(String facultyAddress) {
		this.facultyAddress = facultyAddress;
	}

	public Date getFacultyDOB() {
		return facultyDOB;
	}

	public void setFacultyDOB(Date facultyDOB) {
		this.facultyDOB = facultyDOB;
	}

	public String getFacultyEmail() {
		return facultyEmail;
	}

	public void setFacultyEmail(String facultyEmail) {
		this.facultyEmail = facultyEmail;
	}

	public String getFacultyContact() {
		return facultyContact;
	}

	public void setFacultyContact(String facultyContact) {
		this.facultyContact = facultyContact;
	}

	public String getFaultyClassName() {
		return faultyClassName;
	}

	public void setFaultyClassName(String faultyClassName) {
		this.faultyClassName = faultyClassName;
	}

	public Date getFacultyDateOfJoning() {
		return facultyDateOfJoning;
	}

	public void setFacultyDateOfJoning(Date facultyDateOfJoning) {
		this.facultyDateOfJoning = facultyDateOfJoning;
	}

	public Byte getFacultyPhoto() {
		return facultyPhoto;
	}

	public void setFacultyPhoto(Byte facultyPhoto) {
		this.facultyPhoto = facultyPhoto;
	}

	@Override
	public String toString() {
		return "facultyBean [facultyId=" + facultyId + ", facultyName=" + facultyName + ", facultyAddress="
				+ facultyAddress + ", facultyDOB=" + facultyDOB + ", facultyEmail=" + facultyEmail
				+ ", facultyContact=" + facultyContact + ", faultyClassName=" + faultyClassName
				+ ", facultyDateOfJoning=" + facultyDateOfJoning + ", facultyPhoto=" + facultyPhoto
				+ "]";
	}
	

	

}
