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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tms.beans.BatchBean;
import com.tms.service.BatchService;
import com.tms.service.ClassesService;
import com.tms.service.FacultyService;
import com.tms.utils.RequestUtil;

@Controller
@RequestMapping("/batch")
public class BatchController {
	
	@Autowired
	BatchService batchService;
	
	@Autowired
	ClassesService classesService;
	
	@Autowired
	FacultyService facultyService;

	@RequestMapping(value = "/get/", method = RequestMethod.GET, produces = "application/json")
	public String findAll(ModelMap model){
		model.addAttribute("batchBeans",batchService.findAll());
		return "view_batches";
	}

	@RequestMapping(value = "/add/", method = RequestMethod.POST)
	public String add(ModelMap model, HttpServletRequest request, RedirectAttributes redirectAttributes){
		BatchBean batchBean = RequestUtil.createBatchRequest(request,"add");
		batchService.add(batchBean);
		return "view_batches";
	}
		
	@RequestMapping(value = "/update/", method = RequestMethod.POST)
	public String update(ModelMap model, HttpServletRequest request){	
		System.out.println("in update Maintenance controller");
		BatchBean batchBean = RequestUtil.updateBatchRequest(request,"update");
		batchService.update(batchBean);
		return "view_batches";
	}
	@RequestMapping(value = "/delete/", method = RequestMethod.POST)
	public ResponseEntity<?> delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("Delete controller");
		String batchId = request.getParameter("batch_id");
		batchService.delete(batchId);
		System.out.println("BatchID :"+batchId);
		response.sendRedirect("/tms/view_batches");
		return new ResponseEntity<String>(HttpStatus.CREATED);
		}
	
	@RequestMapping(value = "/addNew/", method = RequestMethod.GET, produces = "application/json")
	public String getClasses(ModelMap model){
		System.out.println("in Get classes");
		model.addAttribute("classesBeans",classesService.findAll());
		model.addAttribute("facultyBeans",facultyService.findAll());
		return "add_batch";
	}
	
	
}
