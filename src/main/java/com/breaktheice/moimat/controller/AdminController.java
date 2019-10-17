package com.breaktheice.moimat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.breaktheice.moimat.domain.AdminVO;
import com.breaktheice.moimat.service.AdminPostService;
import com.breaktheice.moimat.service.AdminService;
import com.breaktheice.moimat.util.AdminCriteria;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	@Autowired
	AdminPostService postService;
	
	@RequestMapping(value= {"/admin","/admin/","/admin/index"})
	public String adminIndex(Model model, AdminCriteria cri) {
		/**
			1. 답변 안한 게시글		-> 테이블
			2. 모임앳 가입일자별로 가입자 수		-> 라인차트
			3. 사용자들이 가장 선택을 많이 한 관심사 5순위 까지  -> 파이차트 
			4. 사용자들이 가장 선택을 많이 한 활동지역 5순위 까지-> 파이차트
			5. 전체 모임에서 가장 선택을 많이한 관심사  5순위 까지 -> 파이차트
			6. 전체 모임에서 가장 선택을 많이한 활동지역  5순위 까지 -> 파이차트
		 */

		// 1. 답변안한 게시글 목록만
		
		//cri.setBrdId(3L);
		
		//총 게시글 수
		//Long totalCount = postService.totalCount(cri);
		//게시글 리스트
		//List<PostDomain> postList = postService.list(cri);
		
//		model.addAttribute("postList", postList);
//		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
	
		return "/admin/index";
	}
	
	@PostMapping("/admin/index/users/regdate")
	@ResponseBody
	public List<AdminVO> memberRegdateCount(){
		// 2. 모임앳 가입일자별로 가입자 수를 JSON으로 반환  (* 클라이언트에서 AJAX로 요청 )
		return service.memberRegdateCount();
	}
	
	@PostMapping("/admin/index/users/interest")
	@ResponseBody
	public List<AdminVO> memberInterestCount(){
		// 3. 전체 회원이 가장 선택을 많이한 관심사를 JSON으로 반환  (* 클라이언트에서 AJAX로 요청 )
		return service.memberInterest();
	}

	@PostMapping("/admin/index/users/area")
	@ResponseBody
	public List<AdminVO> memberAreaCount(){
		// 4. 전체 회원이 가장 선택을 많이한 활동지역를 JSON으로 반환  (* 클라이언트에서 AJAX로 요청 )
		return service.memberArea();
	}


	@PostMapping("/admin/index/groups/interest")
	@ResponseBody
	public List<AdminVO> groupsInterestCount(){
		// 5. 전체 모임에서 가장 선택을 많이한 관심사를 JSON으로 반환  (* 클라이언트에서 AJAX로 요청 )
		return service.groupInterest();
	}

	@PostMapping("/admin/index/groups/area")
	@ResponseBody
	public List<AdminVO> groupsAreaCount(){
		// 6. 전체 모임에서 가장 선택을 많이한 활동지역 JSON으로 반환  (* 클라이언트에서 AJAX로 요청 )
		return service.groupArea();
	}
}
