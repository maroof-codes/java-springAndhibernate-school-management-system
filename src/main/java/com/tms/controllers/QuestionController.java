package com.tms.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tms.beans.QuestionBean;
import com.tms.contants.ServiceConstants;
import com.tms.service.ExamService;
import com.tms.service.QuestionService;
import com.tms.utils.RequestUtil;

@Controller
@RequestMapping(value = "/question")
public class QuestionController {

	@Autowired
	QuestionService questionService;
	
	@Autowired
	ExamService examService;

	@RequestMapping(value = "/get/", method = RequestMethod.GET, produces = "application/json")
	public String findAll(ModelMap model) {
		model.addAttribute("questionBeans", questionService.findAll());
		model.addAttribute("examBeans",examService.findAll());
		return "view_questions";
	}

	@RequestMapping(value = "/uploadExcel/", method = RequestMethod.POST)
	public String fileUploadAndRead(@RequestParam("file") MultipartFile file, ModelMap model,
			HttpServletRequest request) throws IOException {
		System.out.println("in controller");
		// Save file on system
		if (!file.getOriginalFilename().isEmpty()) {
			BufferedOutputStream outputStream = new BufferedOutputStream(
					new FileOutputStream(new File(ServiceConstants.FILE_UPLOAD_PATH, file.getOriginalFilename())));
			outputStream.write(file.getBytes());
			String fileReadPath = ServiceConstants.FILE_UPLOAD_PATH + file.getOriginalFilename();
			outputStream.flush();
			outputStream.close();
			questionService.readDataFromExcelSheet(fileReadPath);
			model.addAttribute("msg", "File uploaded and Read successfully.");
		} else {
			model.addAttribute("msg", "Please select a valid file..");
		}

		return "upload_questions";
	}

	@RequestMapping(value = "/update/", method = RequestMethod.POST)
	public String update(ModelMap model, HttpServletRequest request) {
		System.out.println("in update Maintenance controller");
		QuestionBean questionBean = RequestUtil.updateQuestion(request, "update");
		questionService.update(questionBean);
		return "view_batches";
	}

}
