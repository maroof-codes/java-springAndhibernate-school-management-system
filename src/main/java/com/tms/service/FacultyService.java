package com.tms.service;

import java.util.List;

import com.tms.beans.FacultyBean;

public interface FacultyService {
	public void add(FacultyBean facultyBean);

	public void update(FacultyBean facultyBean);

	public void delete(String facultyId);

	public List<FacultyBean> findAll();

	public FacultyBean findById(String facultyId);

}
