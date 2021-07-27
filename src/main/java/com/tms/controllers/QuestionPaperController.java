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

import com.tms.service.QuestionPaperService;

@Controller
@RequestMapping("/questionPaper")
public class QuestionPaperController {

	@Autowired
	QuestionPaperService questionPaperService;
	
	@RequestMapping(value = "/add/", method = RequestMethod.POST)
	public String findAndAddByID(ModelMap model,HttpServletRequest request){
		String questionPaperId = request.getParameter("question_paper_id");
		String examId = request.getParameter("examId");
		System.out.println("questionPaperId :"+questionPaperId+" examId:"+examId);
		questionPaperService.findAndAdd(questionPaperId,examId);
		return "view_questions";
	}
	
	@RequestMapping(value = "/get/", method = RequestMethod.GET, produces = "application/json")
	public String findAll(ModelMap model){
		model.addAttribute("questionPaperBeans",questionPaperService.findAll());
		return "question_paper";
	}
	
	@RequestMapping(value = "/delete/", method = RequestMethod.POST)
	public ResponseEntity<?> delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("Delete controller");
		String questionId = request.getParameter("question_id");
		questionPaperService.delete(questionId);
		response.sendRedirect("/tms/question_paper");
		return new ResponseEntity<String>(HttpStatus.CREATED);
		}
	
}
