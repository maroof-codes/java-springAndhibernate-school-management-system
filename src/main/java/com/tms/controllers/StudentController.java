package com.tms.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tms.beans.StudentBean;
import com.tms.service.BatchService;
import com.tms.service.ClassesService;
import com.tms.service.StudentService;
import com.tms.utils.RequestUtil;

@Controller
@RequestMapping("/addstudent")
public class StudentController {

	@Autowired
	StudentService studentService;
	
	@Autowired
	BatchService batchService;
	
	@Autowired
	ClassesService classesService;
	
	@RequestMapping(value = "/get/", method = RequestMethod.GET, produces = "application/json")
	public String findAll(ModelMap model) {
		model.addAttribute("addStudentBeans", studentService.findAll());
		return "view_students";
	}

	@RequestMapping(value = "/add/", method = RequestMethod.POST)
	public String add(ModelMap model, HttpServletRequest request) {
		
		StudentBean studentBean = RequestUtil.createStudentRequest(request, "add");
		studentService.add(studentBean);
		return "view_students";
	}

	@RequestMapping(value = "/update/", method = RequestMethod.POST)
	public String update(ModelMap model, HttpServletRequest request) {
		System.out.println("in update method");
		StudentBean studentBean = RequestUtil.updateStudentRequest(request, "update");
		System.out.println("Student Bean :" + studentBean);
		studentService.update(studentBean);
		return "view_students";
	}

	@RequestMapping(value = "/delete/", method = RequestMethod.POST)
	public ResponseEntity<?> delete(HttpServletRequest request) {
		System.out.println("Delete controller");
		String studentId = request.getParameter("student_id");
		studentService.delete(studentId);
		System.out.println("studentId :" + studentId);
		return new ResponseEntity<String>(HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/getValues/", method = RequestMethod.GET, produces = "application/json")
	public String getDropdownValues(ModelMap model) {
		System.out.println("in Get Values of Student");
		model.addAttribute("classesBeans",classesService.findAll());
		model.addAttribute("batchBeans", batchService.findAll());
		return "add_student";
	}
}
