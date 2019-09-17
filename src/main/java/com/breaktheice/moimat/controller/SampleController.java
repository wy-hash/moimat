package com.breaktheice.moimat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.breaktheice.moimat.service.SampleService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class SampleController {

	@Autowired
	private SampleService service;
	
	@GetMapping("/")
	public String index(Model model) {
		
		log.info("request /");
		
		model.addAttribute("domain", service.getSampleDomain());
		
		return "index";
	}
}
