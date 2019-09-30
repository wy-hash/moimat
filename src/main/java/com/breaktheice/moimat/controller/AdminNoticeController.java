package com.breaktheice.moimat.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.service.AdminNoticeService;

@Controller
//@Log4j	
@RequestMapping("/admin/notice")
public class AdminNoticeController {
	
	@Autowired
	private AdminNoticeService service;
	
	// 공지사항 목록 출력 
	@RequestMapping(value= {"","list"})
	public String list(Model model, PostDomain domain) {
		System.out.println("list() 호출");
		domain.setBrdId(1L);//공지사항 조회
		
		
		List<PostDomain> list = service.list(domain);
		
		System.out.println("list =>" +list);
		model.addAttribute("list", list);
		
		return "/admin/notice/list";
	}
	
	// 공지사항 상세
	@RequestMapping("view")
	public String view(Model model, PostDomain domain) {
		
		model.addAttribute("view", service.view(domain));
		return "/admin/notice/view";
	}
	
	// 공지사항 추가
	@RequestMapping("add")
	public String add(Model model, PostDomain domain) {
		//추가
		service.add(domain);
		
		return "redirect:/admin/notice/list";
	}
	
	// 공지사항 수정
	@RequestMapping("update")
	public String update(Model model, PostDomain domain) {
		//수정
		service.update(domain);
		
		return "redirect:/admin/notice/view";
	}
	
	// 공지사항 삭제
	@RequestMapping("remove")
	public String remove(Model model, PostDomain domain) {
		//삭제
		service.remove(domain);
		return "redirect:/admin/notice/list";
	}
	
}
