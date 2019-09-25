package com.breaktheice.moimat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.breaktheice.moimat.domain.Criteria;
import com.breaktheice.moimat.domain.PageDomain;
import com.breaktheice.moimat.service.SearchService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/home")
public class SearchController {

	@Autowired
	private SearchService service;
	
	@GetMapping("/search")
	public String search(Criteria cri, Model model) {
		
		log.info("search controller 실행");
		
		int total = service.totalPage(cri);
		
		model.addAttribute("list", service.list(cri));
		model.addAttribute("pageMaker", new PageDomain(cri, total));
		
		return "search";
	}
	
	@GetMapping("/template")
	public String template() {
		
		return "template";
	}
}
