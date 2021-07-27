package com.tms.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "batch")
public class Batch {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "batch_id")
	private Long batchId;

	@Column(name = "batch_number")
	private String batchNumber;

	@Column(name = "class_name")
	private String className;

	@Column(name = "number_of_students")
	private int numberOfStudents;

	@Column(name = "batch_timing")
	private String batchTiming;

	@Column(name = "assigned_faculty")
	private String assignFaculty;

	public String getAssignFaculty() {
		return assignFaculty;
	}

	public void setAssignFaculty(String assignFaculty) {
		this.assignFaculty = assignFaculty;
	}

	public Long getBatchId() {
		return batchId;
	}

	public void setBatchId(Long batchId) {
		this.batchId = batchId;
	}

	public String getBatchNumber() {
		return batchNumber;
	}

	public void setBatchNumber(String batchNumber) {
		this.batchNumber = batchNumber;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public int getNumberOfStudents() {
		return numberOfStudents;
	}

	public void setNumberOfStudents(int numberOfStudents) {
		this.numberOfStudents = numberOfStudents;
	}

	public String getBatchTiming() {
		return batchTiming;
	}

	public void setBatchTiming(String batchTiming) {
		this.batchTiming = batchTiming;
	}

	@Override
	public String toString() {
		return "Batch [batchId=" + batchId + ", batchNumber=" + batchNumber + ", className=" + className
				+ ", numberOfStudents=" + numberOfStudents + ", batchTiming=" + batchTiming + ", assignFaculty="
				+ assignFaculty + "]";
	}

}
