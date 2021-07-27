package com.tms.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "GenericDropdowns")
public class GenericDropdown {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	
	@Column(name = "gener_id")
	private Long genericId;

	@Column(name = "main_category")
	private String maincategory;
	
	@Column(name = "sub_categoty")
	private String subcategory;
	
	

	public Long getGenericId() {
		return genericId;
	}

	public void setGenericId(Long genericId) {
		this.genericId = genericId;
	}

	public String getMaincategory() {
		return maincategory;
	}

	public void setMaincategory(String maincategory) {
		this.maincategory = maincategory;
	}

	public String getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}

	@Override
	public String toString() {
		return "GenericDropdownBean [genericId=" + genericId + ", maincategory=" + maincategory + ", subcategory="
				+ subcategory + "]";
	}


}
