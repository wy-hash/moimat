package com.breaktheice.moimat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.breaktheice.moimat.service.SampleService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/sample")
public class SampleController {

	@Autowired
	private SampleService service;
	
	@GetMapping("/")
	public String index(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		session.setAttribute("id", "1");
		session.setAttribute("groupid", "2");
		//테스트용
		log.info("request /");
		
		model.addAttribute("domain", service.getSampleDomain());
		
		return "groupview";
	}
	
	@GetMapping("/template")
	public String template() {
		
		return "template";
	}
}
