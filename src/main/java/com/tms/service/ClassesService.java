package com.tms.service;

import java.util.List;

import com.tms.beans.ClassesBean;

public interface ClassesService {
	
	
	public void add(ClassesBean classesBean);

	public void update(ClassesBean classesBean);

	public void delete(String classesId);

	public List<ClassesBean> findAll();

	public ClassesBean findById(String classesId);


}
