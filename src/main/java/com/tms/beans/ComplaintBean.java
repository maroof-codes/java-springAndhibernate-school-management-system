package com.tms.beans;

public class ComplaintBean {
	
	private String complaintDate;
	
	private String complaintTitle;
	
	private String complaintDescription;

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
		return "ComplaintBean [complaintDate=" + complaintDate + ", complaintTitle=" + complaintTitle
				+ ", complaintDescription=" + complaintDescription + "]";
	}
	
	

}
