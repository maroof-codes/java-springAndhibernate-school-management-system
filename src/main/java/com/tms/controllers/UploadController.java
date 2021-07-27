package com.tms.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tms.contants.ServiceConstants;


@Controller
public class UploadController {
	
	@RequestMapping(value = "/uploadExcel", method = RequestMethod.POST)
	public String fileUpload(@RequestParam("file") MultipartFile file, ModelMap model, HttpServletRequest request)
			throws IOException {
		System.out.println("in controller");
		// Save file on system
		if (!file.getOriginalFilename().isEmpty()) {
			BufferedOutputStream outputStream = new BufferedOutputStream(
					new FileOutputStream(new File(ServiceConstants.FILE_UPLOAD_PATH, file.getOriginalFilename())));
			outputStream.write(file.getBytes());
			outputStream.flush();
			outputStream.close();

			model.addAttribute("msg", "File uploaded successfully.");
		} else {
			model.addAttribute("msg", "Please select a valid file..");
		}

		return "upload_questions";
	}

}
