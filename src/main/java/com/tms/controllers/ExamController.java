package com.tms.controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tms.beans.ExamBean;
import com.tms.service.BatchService;
import com.tms.service.ClassesService;
import com.tms.service.ExamService;
import com.tms.service.FacultyService;
import com.tms.utils.RequestUtil;

@Controller
@RequestMapping("/exam")
public class ExamController {

	@Autowired
	ExamService examService;
	
	@Autowired
	BatchService batchService;
	
	@Autowired
	ClassesService classesService;
	
	@Autowired 
	FacultyService facultyService;

	@RequestMapping(value = "/get/", method = RequestMethod.GET, produces = "application/json")
	public String findAll(ModelMap model) {
		model.addAttribute("examBeans", examService.findAll());
		return "view_exams";
	}

	@RequestMapping(value = "/add/", method = RequestMethod.POST)
	public String add(ModelMap model, HttpServletRequest request) {
		ExamBean examBean = RequestUtil.createExamRequest(request, "add");
		examService.add(examBean);
		return "view_exams";
	}

	@RequestMapping(value = "/update/", method = RequestMethod.POST)
	public String update(ModelMap model, HttpServletRequest request) {
		System.out.println("in update method");
		ExamBean examBean = RequestUtil.updateExamRequest(request, "update");
		System.out.println("Exam Bean :" + examBean);
		examService.update(examBean);
		return "view_exams";
	}

	@RequestMapping(value = "/delete/", method = RequestMethod.POST)
	public ResponseEntity<?> delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("Delete controller");
		String examId = request.getParameter("exam_id");
		examService.delete(examId);
		System.out.println("ExamId :" + examId);
		return new ResponseEntity<String>(HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/addNew/", method = RequestMethod.GET, produces = "application/json")
	public String getClasses(ModelMap model){
		System.out.println("in Get classes");
		model.addAttribute("classesBeans",classesService.findAll());
		model.addAttribute("facultyBeans",facultyService.findAll());
		model.addAttribute("batchBeans", batchService.findAll());
		return "add_exam";
	}

}
