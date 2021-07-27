package com.tms.beans;

public class ExamBean {

	private Long examId;

	private String examType;

	private String examDate;

	private String className;

	private String batch;

	private String duration;

	private String examDetails;

	private String examTime;

	private String examTotalMarks;

	private String examCoordinator;

	public String getExamDetails() {
		return examDetails;
	}

	public void setExamDetails(String examDetails) {
		this.examDetails = examDetails;
	}

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

	public String getExamDate() {
		return examDate;
	}

	public void setExamDate(String examDate) {
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
		return "ExamBean [examId=" + examId + ", examType=" + examType + ", examDate=" + examDate + ", className="
				+ className + ", batch=" + batch + ", duration=" + duration + ", examDetails=" + examDetails
				+ ", examTime=" + examTime + ", examTotalMarks=" + examTotalMarks + ", examCoordinator="
				+ examCoordinator + "]";
	}

	
}
