package com.tms.controllers;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String home(Map<String, Object> model) {
		System.out.println("In Index Controller");
		return "index";
	}

	@RequestMapping("/admin")
	public String admin() {
		return "admin";
	}

	@RequestMapping("/add_student")
	public String addStudentReg() {
		return "add_student";
	}

	@RequestMapping("/view_students")
	public String studentList() {
		return "view_students";
	}

	@RequestMapping("/add_faculty")
	public String facultyReg() {
		return "add_faculty";
	}
	@RequestMapping("/view_faculties")
	public String facultyList() {
		return "view_faculties";
	}


	@RequestMapping("/add_tuition")
	public String addTuition() {
		return "add_tuition";
	}

	@RequestMapping("/view_tuitions")
	public String viewTuition() {
		return "view_tuitions";
	}

	@RequestMapping("/add_batch")
	public String addBatch() {
		return "add_batch";
	}
	
	@RequestMapping("/view_batches")
	public String viewBatches() {
		return "view_batches";
	}
	
	@RequestMapping("/add_class")
	public String classesReg() {
		return "add_class";
	}
	@RequestMapping("/view_classes")
	public String classesList() {
		return "view_classes";
	}
	
	@RequestMapping("/add_fees")
	public String addFees() {
		return "add_fees";
	}
	@RequestMapping("/view_fees")
	public String viewFees() {
		return "view_fees";
	}
	@RequestMapping("/add_exam")
	public String addExam() {
		return "add_exam";
	}
	
	@RequestMapping("/view_exams")
	public String view_exams(){
		return "view_exams";
	}


	@RequestMapping("/payment")
	public String payment(){
		return "payment";
	}
	
	@RequestMapping("/upload_questions")
	public String uploadQuestions(){
		return "upload_questions";
	}

}
