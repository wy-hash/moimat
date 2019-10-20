package com.breaktheice.moimat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.breaktheice.moimat.domain.AdminVO;
import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.domain.TeamDomain;
import com.breaktheice.moimat.service.AdminPostService;
import com.breaktheice.moimat.service.AdminService;
import com.breaktheice.moimat.service.AdminTeamService;
import com.breaktheice.moimat.util.AdminCriteria;

@Controller
public class AdminController {
	
	@Autowired AdminService service;
	@Autowired AdminPostService postService;
	@Autowired AdminTeamService teamService;
	
	@RequestMapping(value= {"/admin","/admin/","/admin/index"})
	public String adminIndex(Model model, AdminCriteria cri) {

		// 1. 답변안한 게시글 목록만
		cri.setBrdId(3L);
		cri.setType("Q");
		//게시글 리스트
		List<PostDomain> postList = postService.list(cri);
		model.addAttribute("postList", postList);
		
		// 2. 최근 7일간 신규 모임 리스트 
		List<TeamDomain> teamList = teamService.recentOneWeek(cri);	// 모임 리스트
		model.addAttribute("teamList", teamList);
		
		return "/admin/index";
	}
	
	
	@PostMapping("/admin/index/users/regdate")
	@ResponseBody
	public List<AdminVO> memberRegdateCount(){
		// 모임앳 가입일자별로 가입자 수를 JSON으로 반환  (* 클라이언트에서 AJAX로 요청 )
		return service.memberRegdateCount();
	}
	
	@PostMapping("/admin/index/users/interest")
	@ResponseBody
	public List<AdminVO> memberInterestCount(){
		// 전체 회원이 가장 선택을 많이한 관심사를 JSON으로 반환  (* 클라이언트에서 AJAX로 요청 )
		return service.memberInterest();
	}

	@PostMapping("/admin/index/users/area")
	@ResponseBody
	public List<AdminVO> memberAreaCount(){
		// 전체 회원이 가장 선택을 많이한 활동지역를 JSON으로 반환  (* 클라이언트에서 AJAX로 요청 )
		return service.memberArea();
	}


	@PostMapping("/admin/index/groups/interest")
	@ResponseBody
	public List<AdminVO> groupsInterestCount(){
		// 전체 모임에서 가장 선택을 많이한 관심사를 JSON으로 반환  (* 클라이언트에서 AJAX로 요청 )
		return service.groupInterest();
	}

	@PostMapping("/admin/index/groups/area")
	@ResponseBody
	public List<AdminVO> groupsAreaCount(){
		// 전체 모임에서 가장 선택을 많이한 활동지역 JSON으로 반환  (* 클라이언트에서 AJAX로 요청 )
		return service.groupArea();
	}
}
