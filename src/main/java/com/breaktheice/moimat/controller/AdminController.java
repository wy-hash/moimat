package com.breaktheice.moimat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.breaktheice.moimat.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@RequestMapping(value= {"/admin","/admin/","/admin/index"})
	public String adminIndex() {
		/**
			1. 답변 안한 게시글		-> 테이블
			2. 모임앳 가입일자별로 가입자 수		-> Flot Charts
			3. 사용자들이 가장 선택을 많이 한 관심사 5순위 까지  -> 파이차트
			4. 사용자들이 가장 선택을 많이 한 활동지역 5순위 까지-> 파이차트
			5. 전체 모임에서 가장 선택을 많이한 관심사  5순위 까지 -> 파이차트
			6. 전체 모임에서 가장 선택을 많이한 활동지역  5순위 까지 -> 파이차트
		 */
		
		//2.
		System.out.println(service.memberRegdateCount());
		return "/admin/index";
	}

}
