package com.tms.service;

import java.util.List;

import com.tms.beans.ExamBean;
import com.tms.beans.QuestionBean;

public interface QuestionService {

	public void readDataFromExcelSheet(String filePath);
		
	public void update(QuestionBean questionBean);

	public void delete(String questionId);

	public List<QuestionBean> findAll();

	public ExamBean findById(String questionId);
	
}
