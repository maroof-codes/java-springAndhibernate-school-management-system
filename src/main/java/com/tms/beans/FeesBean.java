package com.tms.beans;

public class FeesBean {

	private Long feesId;

	private String studentName;

	private String dateOfFees;

	private String totalFees;

	private String paidFees;

	private String remainingFees;

	public Long getFeesId() {
		return feesId;
	}

	public void setFeesId(Long feesId) {
		this.feesId = feesId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getDateOfFees() {
		return dateOfFees;
	}

	public void setDateOfFees(String dateOfFees) {
		this.dateOfFees = dateOfFees;
	}

	public String getTotalFees() {
		return totalFees;
	}

	public void setTotalFees(String totalFees) {
		this.totalFees = totalFees;
	}

	public String getPaidFees() {
		return paidFees;
	}

	public void setPaidFees(String paidFees) {
		this.paidFees = paidFees;
	}

	public String getRemainingFees() {
		return remainingFees;
	}

	public void setRemainingFees(String remainingFees) {
		this.remainingFees = remainingFees;
	}

	@Override
	public String toString() {
		return "FeesBean [feesId=" + feesId + ", studentName=" + studentName + ", dateOfFees=" + dateOfFees
				+ ", totalFees=" + totalFees + ", paidFees=" + paidFees
				+ ", remainingFees=" + remainingFees + "]";
	}

}
