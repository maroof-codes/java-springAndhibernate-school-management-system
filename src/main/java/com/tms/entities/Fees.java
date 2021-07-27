package com.tms.entities;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "fees")
public class Fees {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "fees_id")
	private Long feesId;

	@Column(name = "student_name")
	private String studentName;

	@Column(name = "date_of_fees")
	private Date dateOfFees;


	@Column(name = "total_fees")
	private String totalFees;

	@Column(name = "paid_fees")
	private String paidFees;

	@Column(name = "remaining_fees")
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

	public Date getDateOfFees() {
		return dateOfFees;
	}

	public void setDateOfFees(Date dateOfFees) {
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
		return "Fees [feesId=" + feesId + ", studentName=" + studentName + ", dateOfFees=" + dateOfFees
				+ ", totalFees=" + totalFees + ", paidFees=" + paidFees
				+ ", remainingFees=" + remainingFees + "]";
	}

}
