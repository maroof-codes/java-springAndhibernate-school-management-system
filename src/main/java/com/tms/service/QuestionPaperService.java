package com.tms.service;

import java.util.List;

import com.tms.beans.QuestionPaperBean;

public interface QuestionPaperService {
	
	public void add(QuestionPaperBean questionPaperBean);

	public void update(QuestionPaperBean questionPaperBean);

	public void delete(String qp_id);

	public List<QuestionPaperBean> findAll();

	public QuestionPaperBean findById(String qp_id);
	
	public void findAndAdd(String qp_id, String exam_id);

}
