package com.breaktheice.moimat.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.breaktheice.moimat.service.TeamService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@Log4j
public class CommonController {

	@Autowired
	TeamService service;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("randomList", service.getRandomList());
		
		return "index";
	}

	@PostMapping("/upload")
	@ResponseBody
	public String uploadFile(MultipartFile[] uploadFile) throws IOException {

		for (MultipartFile file: uploadFile) {
			log.info("name: " + file.getOriginalFilename());
			log.info("size: " + file.getSize());
		}

		return "{\"result\": \"success\"}";

	}
}
