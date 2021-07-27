package com.tms.beans;

public class GenericDropdownBean {

	private Long genericId;

	private String maincategory;

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
