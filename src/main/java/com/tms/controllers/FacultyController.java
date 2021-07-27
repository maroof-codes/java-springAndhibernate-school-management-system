package com.tms.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tms.beans.FacultyBean;
import com.tms.service.ClassesService;
import com.tms.service.FacultyService;
import com.tms.utils.RequestUtil;

@Controller
@RequestMapping("/faculty")
public class FacultyController {

	@Autowired
	FacultyService facultyService;
	
	@Autowired
	ClassesService classesService;

	@RequestMapping(value = "/get/", method = RequestMethod.GET, produces = "application/json")
	public String findAll(ModelMap model) {
		model.addAttribute("facultyBeans", facultyService.findAll());
		return "view_faculties";
	}

	@RequestMapping(value = "/add/", method = RequestMethod.POST)
	public String add(ModelMap model, HttpServletRequest request) {
		FacultyBean facultyBean = RequestUtil.createFacultyRequest(request, "add");
		facultyService.add(facultyBean);
		return "view_faculties";
	}

	@RequestMapping(value = "/update/", method = RequestMethod.POST)
	public String update(ModelMap model, HttpServletRequest request) {
		System.out.println("in update method");
		FacultyBean facultyBean = RequestUtil.updateFacultyRequest(request, "update");
		System.out.println("Student Bean :" + facultyBean);
		facultyService.update(facultyBean);
		return "view_faculties";
	}

	@RequestMapping(value = "/delete/", method = RequestMethod.POST)
	public ResponseEntity<?> delete(HttpServletRequest request) {
		System.out.println("Delete controller");
		String facultyId = request.getParameter("faculty_id");
		facultyService.delete(facultyId);
		System.out.println("studentId :" + facultyId);
		return new ResponseEntity<String>(HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/addNew/", method = RequestMethod.GET, produces = "application/json")
	public String addNewFaculty(ModelMap model){
		model.addAttribute("classesBeans",classesService.findAll());
		return "add_faculty";
	}
}
