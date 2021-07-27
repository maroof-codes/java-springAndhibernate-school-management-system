package com.tms.controllers;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tms.beans.FeesBean;
import com.tms.service.FeesService;
import com.tms.utils.RequestUtil;

@Controller
@RequestMapping("/fees")
public class FeesController {
	
	@Autowired
	FeesService feesService;
	
	@RequestMapping(value = "/get/", method = RequestMethod.GET, produces = "application/json")
	public String findAll(ModelMap model){
		model.addAttribute("feesBeans",feesService.findAll());
		return "view_fees";
	}

	@RequestMapping(value = "/add/", method = RequestMethod.POST)
	public String add(ModelMap model, HttpServletRequest request){
		
		FeesBean feesBean = RequestUtil.createFeesRequest(request,"add");
		
		feesService.add(feesBean);
		
		return "add_fees";
	}
	
	
	@RequestMapping(value = "/update/", method = RequestMethod.POST)
	public void update(ModelMap model, HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{	
		System.out.println("in update method");
		FeesBean feesBean = RequestUtil.updateFeesRequest(request,"update");	
		System.out.println("Classes Bean :" +feesBean);
		feesService.update(feesBean);
		String message = "Data updated succesfully!!!";
		response.sendRedirect("/TMS/fees/get/?successMessage=" + URLEncoder.encode(message, "UTF-8"));
	}
	
//	request.setAttribute("message", message);
//	request.getRequestDispatcher("").forward(request, response);
	//response.sendRedirect("/TMS/fees/get/");
//	model.addAttribute("successMessage", "Data updated succesfully!!!");
	//return "view_fees";
	
	@RequestMapping(value = "/delete/", method = RequestMethod.POST)
	public ResponseEntity<?> delete( HttpServletRequest request) {
		System.out.println("Delete controller");
		String feesId = request.getParameter("fees_id");
		feesService.delete(feesId);
		System.out.println("classesId :"+feesId);
		return new ResponseEntity<String>(HttpStatus.CREATED);
		}
}
