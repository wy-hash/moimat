package com.breaktheice.moimat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.breaktheice.moimat.domain.BoardDomain;
import com.breaktheice.moimat.domain.MemberDomain;
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
	@PostMapping("delete")
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
		model.addAttribute("areas", service.selectAllAreas());
	 	model.addAttribute("interest", service.selectAllInterest());
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		
		return "/admin/users/write";
	}
	// 회원 등록 쿼리실행
	@PostMapping("new")
	public String addQuery(Model model, MemberDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		System.out.println("add POST()");
		System.out.println(domain);
		
		// 회원 등록 성공시 1이상 반환
		Long result = service.add(domain);
		
		//페이지 정보
//		rttr.addAttribute("memLevel",cri.getMemLevel());
//		rttr.addAttribute("memStatus",cri.getMemStatus());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/admin/users";
	}
	

	// 회원 수정화면
	@GetMapping("{memId}/edit")
	public String edit(Model model, MemberDomain domain, AdminCriteria cri) {
		

		Long totalCount = service.totalCount(cri);
		model.addAttribute("areas", service.selectAllAreas());
	 	model.addAttribute("interest", service.selectAllInterest());
		model.addAttribute("view", service.view(domain));
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		
		return "/admin/users/update";
	}
	
	// 회원 수정 쿼리실행
	@PostMapping("edit")
	public String editQuery(Model model, MemberDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		System.out.println("edit POST()");
		System.out.println(domain);
		
		// 회원 등록 성공시 1이상 반환
		Long result = service.update(domain);
		
		//페이지 정보
//		rttr.addAttribute("memLevel",cri.getMemLevel());
//		rttr.addAttribute("memStatus",cri.getMemStatus());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/admin/users";
	}
	
	
	
	//회원 등급 변경
	@PostMapping("change/level")
	public String changeLevel(MemberDomain domain) {
		//등급변경 실행
		String result = "false";
		
		if (service.changeLevel(domain)>=1L) {
			result="true";
		}
		return "redirect:/admin/users";
	}
	//회원 상태 변경
	@PostMapping("change/status")
	public String changeStatus(MemberDomain domain) {
		//등급변경 실행
		String result = "false";
		
		if (service.changeStatus(domain)>=1L) {
			result="true";
		}
		return "redirect:/admin/users";
	}
	//회원 이메일 중복체크  -> true : 중복 값 없음 / false : 중복 값 있음
	@RequestMapping(value="emailCheck",method=RequestMethod.POST )
	@ResponseBody
	public String emailCheck(MemberDomain domain) throws Exception{
		System.out.println(domain);
		System.out.println( service.emailCheck(domain)+"");
		return service.emailCheck(domain)+"";
	}
}
