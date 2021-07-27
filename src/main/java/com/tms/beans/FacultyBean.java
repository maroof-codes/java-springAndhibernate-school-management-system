package com.tms.beans;

public class FacultyBean {

	private Long facultyId;

	private String facultyName;

	private String facultyAddress;

	private String facultyDOB;

	private String facultyEmail;

	private String facultyContact;

	private String faultyClassName;

	private String facultyDateOfJoining;

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

	public String getFacultyDOB() {
		return facultyDOB;
	}

	public void setFacultyDOB(String facultyDOB) {
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

	public String getFacultyDateOfJoining() {
		return facultyDateOfJoining;
	}

	public void setFacultyDateOfJoining(String facultyDateOfJoning) {
		this.facultyDateOfJoining = facultyDateOfJoning;
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
				+ ", facultyDateOfJoining=" + facultyDateOfJoining +"]";
	}
	
	
	

}
