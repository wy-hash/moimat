package com.breaktheice.moimat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.breaktheice.moimat.service.TeamService;

@Controller
public class CommonController {

	@Autowired
	TeamService service;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("randomList", service.getRandomList());
		
		return "index";
	}
}
