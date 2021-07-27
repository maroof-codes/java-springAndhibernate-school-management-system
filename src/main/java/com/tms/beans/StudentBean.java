package com.tms.beans;

import org.springframework.stereotype.Component;

@Component
public class StudentBean {

	private Long studentId;
	
	private Byte image;
	
	private String studentName;
	
	private String address;
	
	private String dateOfBirth;
	
	private String emailId;
	
	private String number;
	
	private String classname;
	
	private String batchId;

	public Long getStudentId() {
		return studentId;
	}

	public void setStudentId(Long studentId) {
		this.studentId = studentId;
	}

	
	public Byte getImage() {
		return image;
	}

	public void setImage(Byte image) {
		this.image = image;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	public String getBatchId() {
		return batchId;
	}

	public void setBatchId(String batch) {
		this.batchId = batch;
	}

	@Override
	public String toString() {
		return "AddStudentBean [studentId=" + studentId + ", studentName=" + studentName + ", address=" + address
				+ ", dateOfBirth=" + dateOfBirth + ", emailId=" + emailId + ", number=" + number + ", classname="
				+ classname + ", batchId=" + batchId + "]";
	}
	
}
