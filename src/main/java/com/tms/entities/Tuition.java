package com.tms.entities;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tuition")
public class Tuition {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "tuition_id")
	private Long tuitionId;
	
	@Column(name = "tuition_name")
	private String tuitionName;
	
	@Column(name = "tuition_owner_name")
	private String ownerName;
	
	@Column(name = "tuition_established_year")
	private String tuitionEstablishedYear;
	
	@Column(name = "tuition_registration_date")
	private Date tuitionRegistrationDate;
	
	@Column(name = "tuition_gst_no")
	private String tuitionGstNumber;
	
	@Column(name = "tuition_address")
	private String tuitionAddress;
	
	@Column(name = "tuition_contact_no")
	private String tuitionContactNumber;
	
	@Column(name = "tuition_website_address")
	private String tuitionWebsiteAddress;
	
	@Column(name = "tuition_email_address")
	private String tuitionEmailAddress;

	public Long getTuitionId() {
		return tuitionId;
	}

	public void setTuitionId(Long tuitionId) {
		this.tuitionId = tuitionId;
	}

	public String getTuitionName() {
		return tuitionName;
	}

	public void setTuitionName(String tuitionName) {
		this.tuitionName = tuitionName;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public String getTuitionEstablishedYear() {
		return tuitionEstablishedYear;
	}

	public void setTuitionEstablishedYear(String tuitionEstablishedYear) {
		this.tuitionEstablishedYear = tuitionEstablishedYear;
	}

	public Date getTuitionRegistrationDate() {
		return tuitionRegistrationDate;
	}

	public void setTuitionRegistrationDate(Date tuitionRegistrationDate) {
		this.tuitionRegistrationDate = tuitionRegistrationDate;
	}

	public String getTuitionGstNumber() {
		return tuitionGstNumber;
	}

	public void setTuitionGstNumber(String tuitionGstNumber) {
		this.tuitionGstNumber = tuitionGstNumber;
	}

	public String getTuitionAddress() {
		return tuitionAddress;
	}

	public void setTuitionAddress(String tuitionAddress) {
		this.tuitionAddress = tuitionAddress;
	}

	public String getTuitionContactNumber() {
		return tuitionContactNumber;
	}

	public void setTuitionContactNumber(String tuitionContactNumber) {
		this.tuitionContactNumber = tuitionContactNumber;
	}

	public String getTuitionWebsiteAddress() {
		return tuitionWebsiteAddress;
	}

	public void setTuitionWebsiteAddress(String tuitionWebsiteAddress) {
		this.tuitionWebsiteAddress = tuitionWebsiteAddress;
	}

	public String getTuitionEmailAddress() {
		return tuitionEmailAddress;
	}

	public void setTuitionEmailAddress(String tuitionEmailAddress) {
		this.tuitionEmailAddress = tuitionEmailAddress;
	}

	@Override
	public String toString() {
		return "Tuition [tuitionId=" + tuitionId + ", tuitionName=" + tuitionName + ", ownerName=" + ownerName
				+ ", tuitionEstablishedYear=" + tuitionEstablishedYear + ", tuitionRegistrationDate="
				+ tuitionRegistrationDate + ", tuitionGstNumber=" + tuitionGstNumber + ", tuitionAddress="
				+ tuitionAddress + ", tuitionContactNumber=" + tuitionContactNumber + ", tuitionWebsiteAddress="
				+ tuitionWebsiteAddress + ", tuitionEmailAddress=" + tuitionEmailAddress + "]";
	}


}
