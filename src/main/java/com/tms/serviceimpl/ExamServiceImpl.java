package com.tms.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tms.beans.ExamBean;
import com.tms.dao.GenericDao;
import com.tms.entities.Exam;
import com.tms.service.ExamService;
import com.tms.utils.BeanUtils;

@Service
public class ExamServiceImpl implements ExamService {
	
	@Autowired
	private GenericDao<Exam> genericDao;
	
	@Override
	public void add(ExamBean examBean) {
		Exam exam = BeanUtils.populateExam(examBean);
		genericDao.addEntity(exam);
	}

	@Override
	public void update(ExamBean examBean) {
		Exam exam = BeanUtils.populateExam(examBean);
		genericDao.updateEntity(exam);
	}

	@Override
	public void delete(String examId) {
		genericDao.deleteEntity(Long.valueOf(examId),Exam.class);
	}

	@Override
	public List<ExamBean> findAll() {
        List<Exam> exams = genericDao.findAll(Exam.class);
		return BeanUtils.populateExamBeanList(exams);
	}

	@Override
	public ExamBean findById(String examId) {
		return null;
//        Exam exam = genericDao.findEntityById(Exam.class, examId);
//		return BeanUtils.populateExamBean(exam);
	}

	
	
	
	

}
