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

import com.tms.beans.TuitionBean;
import com.tms.service.TuitionService;
import com.tms.utils.RequestUtil;

@Controller
@RequestMapping("/tuition")
public class TuitionController {
	@Autowired
	TuitionService tuitionService;
	
	@RequestMapping(value = "/get/", method = RequestMethod.GET, produces = "application/json")
	public String findAll(ModelMap model){
		model.addAttribute("tuitionBeans",tuitionService.findAll());
		return "view_tuitions";
	}

	@RequestMapping(value = "/add/", method = RequestMethod.POST)
	public String add(ModelMap model, HttpServletRequest request){
		TuitionBean tuitionBean = RequestUtil.createTuitionRequest(request,"add");
		tuitionService.add(tuitionBean);
		return "view_tuitions";
	}
		
	@RequestMapping(value = "/update/", method = RequestMethod.POST)
	public String update(ModelMap model, HttpServletRequest request){	
		System.out.println("in update Maintenance controller");
		TuitionBean tuitionBean = RequestUtil.updateTuitionRequest(request, "update");
		tuitionService.update(tuitionBean);
		return "view_tuitions";
	}

	
	@RequestMapping(value = "/delete/", method = RequestMethod.POST)
	public ResponseEntity<?> delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("Delete controller");
		String tuitionId = request.getParameter("tuition_id");
		tuitionService.delete(tuitionId);
		System.out.println("tuitionId :"+tuitionId);
		response.sendRedirect("/tms/view_tuitions");
		return new ResponseEntity<String>(HttpStatus.CREATED);
		}

}
