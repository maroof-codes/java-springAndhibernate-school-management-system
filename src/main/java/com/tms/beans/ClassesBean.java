package com.tms.beans;

public class ClassesBean {
	
	private  Long classesId;
	
	private String classesName;
	
	private String classesDescription;

	public Long getClassesId() {
		return classesId;
	}

	public void setClassesId(Long classesId) {
		this.classesId = classesId;
	}

	public String getClassesName() {
		return classesName;
	}

	public void setClassesName(String classesName) {
		this.classesName = classesName;
	}

	public String getClassesDescription() {
		return classesDescription;
	}

	public void setClassesDescription(String classesDescription) {
		this.classesDescription = classesDescription;
	}

	@Override
	public String toString() {
		return "ClassesBean [classesId=" + classesId + ", classesName=" + classesName + ", classesDescription="
				+ classesDescription + "]";
	}
	
	
	

		
	

}
