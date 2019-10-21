package com.breaktheice.moimat.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.Criteria;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	private SearchService service;
	
	//search 메인화면
	@GetMapping(value= {"/search","/search/"})
	public String search(Criteria cri, Model model) {

		model.addAttribute("cri", cri);
		return "search/result";
	}
	
	//검색한 화면
	@PostMapping(value= {"/result","/result/"})
	public String result(Criteria cri, Model model) {
		
		System.out.println(cri);
		model.addAttribute("cri", cri);
		model.addAttribute("keyword", service.recommend(cri));
		
		return "search/result";
	}

	//관심사를 json형태로 전달
	@PostMapping("/search")
	@ResponseBody
	public List<InterestDomain> interestList() throws IOException {
		
		return service.list();
	}
	//관심사를 json형태로 전달
	@PostMapping("/search/area/list")
	@ResponseBody
	public List<AreaDomain> areaList() throws IOException {
		
		return service.areaList();
	}
	
		
	//관심사에 대한 자동완성
	@PostMapping("/search/interest")
	@ResponseBody
	public List<String> autoInterestList(HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		String keyword = request.getParameter("keyword");
		Criteria cri = new Criteria();
		cri.setKeyword(keyword);
		
		return service.autocompleteInte(cri);
	}
	
	//지역에 대한 자동완성
	@PostMapping("/search/area")
	@ResponseBody
	public List<String> autoAreaList(HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		String keyword = request.getParameter("keyword");
		Criteria cri = new Criteria();
		cri.setKeyword(keyword);
		
		return service.autocompleteArea(cri);
	}
}
