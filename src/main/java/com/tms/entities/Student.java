package com.tms.entities;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="addstudent")
public class Student {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "student_id")
	private Long studentId;
	
	@Column(name = "Image")
	private Byte image;
	
	@Column(name = "student_name")
	private String studentName;
	
	@Column(name = "student_address")
	private String address;
	
	@Column(name = "student_dob")
	private Date dateOfBirth;
	
	@Column(name = "student_emailid")
	private String emailId;
	
	@Column(name = "student_number")
	private String number;
	
	@Column(name = "student_class_name")
	private String classname;
	
	@Column(name = "student_batch_Id")
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

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
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
