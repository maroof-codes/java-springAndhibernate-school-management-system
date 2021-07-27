package com.tms.beans;

public class BatchBean {

	private Long batchId;

	private String batchNumber;

	private String className;

	private int numberOfStudents;

	private String batchTiming;

	private String assignFaculty;

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

	public String getAssignFaculty() {
		return assignFaculty;
	}

	public void setAssignFaculty(String assignFaculty) {
		this.assignFaculty = assignFaculty;
	}

	@Override
	public String toString() {
		return "BatchBean [batchId=" + batchId + ", batchNumber=" + batchNumber + ", className=" + className
				+ ", numberOfStudents=" + numberOfStudents + ", batchTiming=" + batchTiming + ", assignFaculty="
				+ assignFaculty + "]";
	}

}
