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

import com.tms.beans.ClassesBean;
import com.tms.service.ClassesService;
import com.tms.utils.RequestUtil;

@Controller
@RequestMapping("/classes")
public class ClassesController {
	
	@Autowired
	ClassesService classesService;
	
	@RequestMapping(value = "/get/", method = RequestMethod.GET, produces = "application/json")
	public String findAll(ModelMap model){
		model.addAttribute("classesBeans",classesService.findAll());
		return "view_classes";
	}

	@RequestMapping(value = "/add/", method = RequestMethod.POST)
	public String add(ModelMap model, HttpServletRequest request){
		ClassesBean classesBean = RequestUtil.createClassesRequest(request,"add");
		classesService.add(classesBean);
		return "view_classes";
	}
	
	
	@RequestMapping(value = "/update/", method = RequestMethod.POST)
	public String update(ModelMap model, HttpServletRequest request){	
		System.out.println("in update method");
		ClassesBean classesBean = RequestUtil.updateClassesRequest(request,"update");	
		System.out.println("Classes Bean :" +classesBean);
		classesService.update(classesBean);
		return "view_classes";
	}

	
	@RequestMapping(value = "/delete/", method = RequestMethod.POST)
	public ResponseEntity<?> delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("Delete controller");
		String classesId = request.getParameter("classes_id");
		classesService.delete(classesId);
		System.out.println("classesId :"+classesId);
		//response.sendRedirect("/tms/view_tuitions");
		return new ResponseEntity<String>(HttpStatus.CREATED);
		}

	@RequestMapping(value = "/getClasses/", method = RequestMethod.GET, produces = "application/json")
	public String getClasses(ModelMap model){
		System.out.println("in Get classes");
		model.addAttribute("classesBeans",classesService.findAll());
		return "add_batch";
	}
}
