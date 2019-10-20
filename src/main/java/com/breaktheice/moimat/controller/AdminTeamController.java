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
import com.breaktheice.moimat.domain.TeamDomain;
import com.breaktheice.moimat.service.AdminTeamService;
import com.breaktheice.moimat.util.AdminCriteria;
import com.breaktheice.moimat.util.AdminPageDTO;

@Controller
@RequestMapping("/admin/groups")
public class AdminTeamController {
	
	/**
	 * 1. 모임개설 기능
		  1) 이용자 작성 내용 
		     - 모임명
		     - 모임 소개글 
		     - 모임 썸네일
		     - 모임 인원 
		     - 모임 관심사
		     - 모임 지역"
	 */
	
	@Autowired
	private AdminTeamService service;
	
	@RequestMapping(value= {"","list"})
	public String list(Model model, AdminCriteria cri) {
		// 총 모임 수
		Long totalCount = service.totalCount(cri);
		// 모임 리스트
		List<TeamDomain> teamList = service.list(cri);

		model.addAttribute("teamList", teamList);
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		
		return "/admin/groups/list";
	}
	

	// 모임 상세
	@RequestMapping("{teamId}/view")
	public String view(Model model, TeamDomain domain, AdminCriteria cri) {

		Long totalCount = service.totalCount(cri);
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//검색정보 및 페이지 정보
		
		model.addAttribute("view", service.view(domain));
		
		return "/admin/groups/view";
	}
	// 모임 등록화면
	@GetMapping("new")
	public String add(Model model, TeamDomain domain, AdminCriteria cri) {
		

		Long totalCount = service.totalCount(cri);
		model.addAttribute("areas", service.selectAllAreas());
	 	model.addAttribute("interest", service.selectAllInterest());
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		
		return "/admin/groups/write";
	}
	// 모임 등록 쿼리실행
	@PostMapping("new")
	public String addQuery(Model model, TeamDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		// 모임 등록 성공시 1이상 반환
		Long result = service.add(domain);
		
		//페이지 정보
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/admin/groups";
	}
	// 모임 수정화면
	@GetMapping("{teamId}/edit")
	public String edit(Model model, TeamDomain domain, AdminCriteria cri) {
		

		Long totalCount = service.totalCount(cri);
		model.addAttribute("areas", service.selectAllAreas());
	 	model.addAttribute("interest", service.selectAllInterest());
		model.addAttribute("view", service.view(domain));
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		
		return "/admin/groups/update";
	}
	
	// 모임 수정 쿼리실행
	@PostMapping("edit")
	public String editQuery(Model model, TeamDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		Long result = service.update(domain);
		
		//페이지 정보
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/admin/groups";
	}

	// 모임 삭제
	@PostMapping("delete")
	public String remove(Model model, TeamDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		//삭제
		service.remove(domain);
		//페이지 정보
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/admin/groups";
	}

}
