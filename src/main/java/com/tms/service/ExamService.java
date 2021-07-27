package com.tms.service;

import java.util.List;

import com.tms.beans.ExamBean;

public interface ExamService {

	public void add(ExamBean examBean);

	public void update(ExamBean examBean);

	public void delete(String examId);

	public List<ExamBean> findAll();

	public ExamBean findById(String examId);

	
}
