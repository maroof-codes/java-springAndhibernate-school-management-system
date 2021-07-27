package com.tms.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tms.beans.GenericDropdownBean;
import com.tms.service.GenericDropdownService;
import com.tms.utils.RequestUtil;

@RestController
@RequestMapping("/GenericDropdown")
public class GenericDropdownController {
	@Autowired
	GenericDropdownService genericDropdownService; 

	@RequestMapping(value = "/get/", method = RequestMethod.GET, produces = "application/json")
	public List<GenericDropdownBean> findAll() {
		return genericDropdownService.findAll();
	}
	
	@RequestMapping(value = "/add/", method = RequestMethod.POST)
	public void createUser(HttpServletRequest request) {
	   System.out.println("GENERICDROPDOWN CONTROLLER");
	   GenericDropdownBean genericDropdownBean = RequestUtil.createGenericDropdownRequest(request);
       genericDropdownService.add(genericDropdownBean);
	}
	
	@RequestMapping(value = "/update/", method = RequestMethod.POST)
	public ResponseEntity<?> update(@RequestBody GenericDropdownBean genericDropdownBean) {
		genericDropdownService.update(genericDropdownBean);
		return new ResponseEntity<String>(HttpStatus.CREATED);
	}

	
	@RequestMapping(value = "/delete/", method = RequestMethod.POST)
	public ResponseEntity<?> delete( HttpServletRequest request) {
		System.out.println("Delete maintenance controller");
		String maintenanceId = request.getParameter("maintenance_id");
	genericDropdownService.delete(maintenanceId);
		return new ResponseEntity<String>(HttpStatus.CREATED);
	}
	
	

}
