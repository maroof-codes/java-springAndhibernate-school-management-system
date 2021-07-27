package com.tms.entities;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Exam")
public class Exam {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "exam_Id")
	private Long examId;

	@Column(name = "exam_Type")
	private String examType;

	@Column(name = "exam_Date")
	private Date examDate;

	@Column(name = "exam_Time")
	private String examTime;

	@Column(name = "exam_Total_Marks")
	private String examTotalMarks;

	@Column(name = "exam_Coordinator")
	private String examCoordinator;
	
	@Column(name = "class_name")
	private String className;

	@Column(name = "batch")
	private String batch;
	
	@Column(name = "duration")
	private String duration;

	@Column(name = "exam_details")
	private String examDetails;



	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getBatch() {
		return batch;
	}

	public void setBatch(String batch) {
		this.batch = batch;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getExamDetails() {
		return examDetails;
	}

	public void setExamDetails(String examDetails) {
		this.examDetails = examDetails;
	}


	public Long getExamId() {
		return examId;
	}

	public void setExamId(Long examId) {
		this.examId = examId;
	}

	public String getExamType() {
		return examType;
	}

	public void setExamType(String examType) {
		this.examType = examType;
	}

	public Date getExamDate() {
		return examDate;
	}

	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}

	public String getExamTime() {
		return examTime;
	}

	public void setExamTime(String examTime) {
		this.examTime = examTime;
	}

	public String getExamTotalMarks() {
		return examTotalMarks;
	}

	public void setExamTotalMarks(String examTotalMarks) {
		this.examTotalMarks = examTotalMarks;
	}

	public String getExamCoordinator() {
		return examCoordinator;
	}

	public void setExamCoordinator(String examCoordinator) {
		this.examCoordinator = examCoordinator;
	}

	@Override
	public String toString() {
		return "Exam [examId=" + examId + ", examType=" + examType + ", examDate=" + examDate + ", examTime=" + examTime
				+ ", examTotalMarks=" + examTotalMarks + ", examCoordinator=" + examCoordinator + ", className="
				+ className + ", batch=" + batch + ", duration=" + duration + ", examDetails=" + examDetails + "]";
	}


}
