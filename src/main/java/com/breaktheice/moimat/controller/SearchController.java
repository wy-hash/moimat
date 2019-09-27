package com.breaktheice.moimat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.breaktheice.moimat.domain.PageDomain;
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
	public String search(Criteria cri, InterestDomain inte, Model model) {
		
		log.info("search controller 실행");
		
		int total = service.totalPage(cri);
		
		model.addAttribute("list", service.list(cri));
		model.addAttribute("pageMaker", new PageDomain(cri, total));
		model.addAttribute("intName", inte);
		model.addAttribute("recom", service.recommend());
		model.addAttribute("result", service.recomResult());
		
		return "search";
	}
	
	@GetMapping("/template")
	public String template() {
		
		return "template";
	}
	
	
	@PostMapping("/search")
	@ResponseBody
	public void recommend(HttpServletRequest request,HttpServletResponse response,
			InterestDomain inte) throws IOException {
		
		log.info("recommend");
		
		String result = request.getParameter("term");
		
		List<InterestDomain> list = service.autocomplete(result);
		
		JsonArray ja = new JsonArray();
		
		for(int i = 0; i < list.size(); i++) {
			ja.add(list.get(i).getIntName());
		}
		
		PrintWriter out = response.getWriter();
		out.print(ja.toString());
	}
}
