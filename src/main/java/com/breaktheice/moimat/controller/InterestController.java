package com.breaktheice.moimat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.service.InterestService;

@Controller
@RequestMapping("/admin/interest")
public class InterestController {
	
	@Autowired
	private InterestService service;
	
	//관심사 목록출력
	@RequestMapping(value = {"", "list"})
	public String list(Model model) {
		
		List<InterestDomain> list = service.list();
		
		model.addAttribute("list", list);
		
		return "/admin/interest/list";
	}
	
	//관심사 등록
	@RequestMapping("add")
	public String add(Model model, InterestDomain domain) throws Exception{
		
		//관심사 등록 성공시 1 이상 반환
		int result = service.add(domain);
		
		return "redirect:/admin/interest";
	}
	
	//관심사 상세
	@RequestMapping("view")
	public String view(Model model, InterestDomain domain) throws Exception{
		
		//관심사 상세
		InterestDomain result = service.view(domain);
		
		model.addAttribute("view", result);
		
		return "/admin/interest/view";
	}
	//관심사 수정
	@RequestMapping("update")
	public String update(Model model, InterestDomain domain) throws Exception{

		//관심사 수정성공시 1이상반환
		int result = service.update(domain);
		
		
		
		return "redirect:/admin/interest";
	}
	
	
	//관심사 삭제
	@RequestMapping("remove")
	public String remove(Model model, InterestDomain domain) throws Exception{
		
		//관심사 삭제성공시 1이상반환
		int result = service.remove(domain);
		
		
		return "redirect:/admin/interest";
	}
}
