package com.tms.main;

import org.springframework.context.annotation.Bean;

import com.tms.service.BatchService;
import com.tms.service.ClassesService;
import com.tms.service.ExamService;
import com.tms.service.FacultyService;
import com.tms.service.FeesService;
import com.tms.service.QuestionPaperService;
import com.tms.service.QuestionService;
import com.tms.service.StudentService;
import com.tms.service.TuitionService;
import com.tms.serviceimpl.BatchServiceImpl;
import com.tms.serviceimpl.ClassesServiceImpl;
import com.tms.serviceimpl.ExamServiceImpl;
import com.tms.serviceimpl.FacultyServiceImpl;
import com.tms.serviceimpl.FeesServiceImpl;
import com.tms.serviceimpl.QuestionPaperServiceImpl;
import com.tms.serviceimpl.QuestionServiceImpl;
import com.tms.serviceimpl.StudentServiceImpl;
import com.tms.serviceimpl.TuitionServiceImpl;


public class TuitionManagementSystem {

	@Bean 
	public TuitionService getTuitionService(){
		return new TuitionServiceImpl();
			
	}
	@Bean
	public StudentService getAddStudentService () {
		return new StudentServiceImpl();
	}
	@Bean
	public FacultyService getFacultyService(){
		return new FacultyServiceImpl();
	}

	@Bean
	public BatchService getBatchService() {
		return new BatchServiceImpl();
	}

	@Bean
	public ClassesService getClassesService() {
		return new ClassesServiceImpl();
	}

	@Bean 
	public ExamService getExamService(){
		return new ExamServiceImpl();
	}
	
	@Bean
	public FeesService getFeesService(){
		return new FeesServiceImpl();
	}
		
	@Bean
	public QuestionPaperService getQuestionPaperService(){
		return new QuestionPaperServiceImpl();
	}
	
	@Bean
	public QuestionService getQuestionService(){
		return new QuestionServiceImpl();
	}
	

}
