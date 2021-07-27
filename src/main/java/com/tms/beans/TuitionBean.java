package com.tms.beans;

public class TuitionBean {

	private Long tuitionId;
	
	private String tuitionName;
	
	private String ownerName;
	
	private String tuitionEstablishedYear;
	
	private String tuitionRegistrationDate;
	
	private String tuitionGstNumber;
	
	private String tuitionAddress;
	
	private String tuitionContactNumber;
	
	private String tuitionWebsiteAddress;
	
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

	public String getTuitionRegistrationDate() {
		return tuitionRegistrationDate;
	}

	public void setTuitionRegistrationDate(String tuitionRegistrationDate) {
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
		return "TuitionBean [tuitionId=" + tuitionId + ", tuitionName=" + tuitionName + ", ownerName=" + ownerName
				+ ", tuitionEstablishedYear=" + tuitionEstablishedYear + ", tuitionRegistrationDate="
				+ tuitionRegistrationDate + ", tuitionGstNumber=" + tuitionGstNumber + ", tuitionAddress="
				+ tuitionAddress + ", tuitionContactNumber=" + tuitionContactNumber + ", tuitionWebsiteAddress="
				+ tuitionWebsiteAddress + ", tuitionEmailAddress=" + tuitionEmailAddress + "]";
	}
	
	
	
	
}
