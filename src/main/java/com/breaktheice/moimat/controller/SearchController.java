package com.breaktheice.moimat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.breaktheice.moimat.domain.Criteria;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.service.SearchService;
import com.google.gson.JsonArray;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/home")
public class SearchController {

	@Autowired
	private SearchService service;
	
	@GetMapping("/search")
	public String search() {
		
		log.info("search controller 실행");
		
		return "result";
		
	}
	
	@PostMapping("/result")
	public String result(Criteria cri, Model model) {
		
		log.info(cri.getKeyword());
		
		model.addAttribute("keyword", service.recommend(cri));
		
		return "result";
		
	}
	
	@GetMapping("/template")
	public String template() {
		
		return "template";
	}
	
	
	@PostMapping("/search")
	@ResponseBody
	public void recommend(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		log.info("recommend");
		response.setContentType("text/html;charset=UTF-8");
		String keyword = request.getParameter("term");
		
		JsonArray json = new JsonArray();
		
		List<InterestDomain> list = service.autocomplete(keyword);
		
		
		for(int i = 0; i < list.size(); i++) {
			json.add(list.get(i).getIntName());
		}
		
		PrintWriter out = response.getWriter();
		out.print(json.toString());
	}
}
