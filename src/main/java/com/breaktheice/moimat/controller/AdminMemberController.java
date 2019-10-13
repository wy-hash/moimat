package com.breaktheice.moimat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.service.AdminMemberService;
import com.breaktheice.moimat.util.AdminCriteria;
import com.breaktheice.moimat.util.AdminPageDTO;

@Controller
@RequestMapping("/admin/users")
public class AdminMemberController {
	
	/*
	 * 1. 유저 관리
		  1) 앱에 가입한 유저 관리
		    - 유저 정보 조회
		    - 유저 검색
		    - 권한 설정
		    - 탈퇴 처리 
		  2) 탈퇴한 이용자 관리
		    - 탈퇴시 일정 기간 동안 정보 보관
	 */
	
	@Autowired
	private AdminMemberService service;
	
	@RequestMapping(value= {"","list"})
	public String list(Model model, AdminCriteria cri) {

		System.out.println(cri);
		//총 회원 수
		Long totalCount = service.totalCount(cri);
		System.out.println(totalCount);
		//회원 리스트
		List<MemberDomain> memList = service.list(cri);
		
		//검색 - 등급, 상태 
		model.addAttribute("memList", memList);
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		
		return "/admin/users/list";
	}
	
	// 회원 상세
	@RequestMapping("{memId}/view")
	public String view(Model model, MemberDomain domain, AdminCriteria cri) {

		Long totalCount = service.totalCount(cri);
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//검색정보 및 페이지 정보
		
		model.addAttribute("view", service.view(domain));
		
		return "/admin/users/view";
	}
	

	// 게시글 삭제
	@RequestMapping("delete")
	public String remove(Model model, MemberDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		//삭제
		service.remove(domain);
		//페이지 정보
		rttr.addAttribute("memLevel",cri.getMemLevel());
		rttr.addAttribute("memStatus",cri.getMemStatus());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/admin/users";
	}
	// 회원 등록화면
	@GetMapping("new")
	public String add(Model model, MemberDomain domain, AdminCriteria cri) {
		

		Long totalCount = service.totalCount(cri);
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		
		return "/admin/users/write";
	}
	
	// 회원 등록 쿼리실행
	@PostMapping("new")
	public String addQuery(Model model, MemberDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		System.out.println("add POST()");
		
		domain.setAreaId(1L);
		domain.setMemLevel(1L);
		domain.setMemStatus(1L);
		domain.setMemInt1(1L);
		domain.setMemInt2(2L);
		domain.setMemInt3(3L);
		System.out.println(domain);
		
		s
		
		// 회원 등록 성공시 1이상 반환
		Long result = service.add(domain);
		
		//페이지 정보
		rttr.addAttribute("memLevel",cri.getMemLevel());
		rttr.addAttribute("memStatus",cri.getMemStatus());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/admin/users";
	}
}
