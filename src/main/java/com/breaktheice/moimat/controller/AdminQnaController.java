package com.breaktheice.moimat.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.service.AdminQnaService;
import com.breaktheice.moimat.util.AdminCriteria;
import com.breaktheice.moimat.util.AdminPageDTO;

@Controller
//@Log4j	
@RequestMapping("/admin/qna")
public class AdminQnaController {
	
	@Autowired
	private AdminQnaService service;
	
	// 질문과 답변 목록 출력 
	@RequestMapping(value= {"","list"})
	public String list(Model model, PostDomain domain, AdminCriteria cri) {
		System.out.println("list() 호출");
		cri.setBrdId(2L);//질문과 답변 조회
		
		//총 게시물 수
		Long totalCount = service.totalCount(cri);
		
		//리스트
		List<PostDomain> list = service.list(cri);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		
		
		
		return "/admin/qna/list";
	}
	
	// 질문과 답변 작성화면
	@GetMapping("new")
	public String add(PostDomain domain, AdminCriteria cri) {
		
		return "/admin/qna/write";
	}
	// 질문과 답변 작성 쿼리실행
	@PostMapping("new")
	public String add(Model model, PostDomain domain, AdminCriteria cri) {
		System.out.println("add POST()");
		System.out.println(domain);
		
		
		// 질문과 답변 등록 성공시 1이상 반환
		Long result = service.add(domain);
		
		return "redirect:/admin/qna";
	}
	
	// 질문과 답변 상세
	@RequestMapping("view/{postId}")
	public String view(Model model, PostDomain domain, AdminCriteria cri) {
		//조회수 증가
		service.viewCount(domain);
		model.addAttribute("view", service.view(domain));
		
		return "/admin/qna/view";
	}
	
	// 질문과 답변 수정화면
	@GetMapping("edit/{postId}")
	public String update(Model model, PostDomain domain, AdminCriteria cri) {
		model.addAttribute("view", service.view(domain));
		return "/admin/qna/update";
	}
	
	// 질문과 답변 수정
	@PostMapping("edit")
	public String updateQuery(Model model, PostDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		System.out.println("수정");		
		System.out.println(domain);
		//수정
		service.update(domain);
		
		//페이지 정보
		rttr.addAttribute("brdId",cri.getBrdId());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/admin/qna";
	}
	
	// 질문과 답변 삭제
	@RequestMapping("delete")
	public String remove(Model model, PostDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		//삭제
		service.remove(domain);
		//페이지 정보
		rttr.addAttribute("brdId",cri.getBrdId());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/admin/qna";
	}
	
	
}
