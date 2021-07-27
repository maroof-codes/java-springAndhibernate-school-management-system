package com.tms.service;

import java.util.List;

import com.tms.beans.StudentBean;

public interface StudentService {

	public void add(StudentBean studentBean);

	public void update(StudentBean studentBean);

	public void delete(String studentId);

	public List<StudentBean> findAll();

	public StudentBean findById(String studentId);

}
