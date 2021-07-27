package com.tms.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="addstudent")
public class Complaint {
	@Column(name = "complaint_id")
	private String complaintId;
	
	@Column(name = "complaint_date")
	private String complaintDate;
	
	@Column(name = "complaint_title")
	private String complaintTitle;
	
	@Column(name = "complaint_description")
	private String complaintDescription;

	public String getComplaintId() {
		return complaintId;
	}

	public void setComplaintId(String complaintId) {
		this.complaintId = complaintId;
	}

	public String getComplaintDate() {
		return complaintDate;
	}

	public void setComplaintDate(String complaintDate) {
		this.complaintDate = complaintDate;
	}

	public String getComplaintTitle() {
		return complaintTitle;
	}

	public void setComplaintTitle(String complaintTitle) {
		this.complaintTitle = complaintTitle;
	}

	public String getComplaintDescription() {
		return complaintDescription;
	}

	public void setComplaintDescription(String complaintDescription) {
		this.complaintDescription = complaintDescription;
	}

	@Override
	public String toString() {
		return "Complaint [complaintId=" + complaintId + ", complaintDate=" + complaintDate + ", complaintTitle="
				+ complaintTitle + ", complaintDescription=" + complaintDescription + "]";
	}
	
	

	
}
