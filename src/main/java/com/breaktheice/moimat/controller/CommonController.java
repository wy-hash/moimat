package com.breaktheice.moimat.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.service.TeamService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {

	@Autowired
	TeamService service;
	
	@GetMapping(value= {"/home","/home/"})
	public String index(Model model, HttpSession session) {
		
		//Session
		MemberDomain domain = (MemberDomain) session.getAttribute("loginVO");
		
		model.addAttribute("randomList", service.getRandomList());
		model.addAttribute("int1Name", service.getInterestName(domain.getMemInt1()));// 사용자의 첫 번째 관심사 이름 
		model.addAttribute("int1List", service.getIntRandomList(domain.getMemInt1()));// 사용자의 첫 번째 관심사 기준 추천 모임 
		
		model.addAttribute("int2Name", service.getInterestName(domain.getMemInt2()));// 사용자의 두 번째 관심사 이름
		model.addAttribute("int2List", service.getIntRandomList(domain.getMemInt2()));// 사용자의 두 번째 관심사 기준 추천 모임
		
		model.addAttribute("int3Name", service.getInterestName(domain.getMemInt3()));// 사용자의 세 번째 관심사 이름
		model.addAttribute("int3List", service.getIntRandomList(domain.getMemInt3()));// 사용자의 세 번째 관심사 기준 추천 모임
		
		model.addAttribute("areaName", service.getAreaName(domain.getAreaId()));// 사용자의 활동지역 이름
		model.addAttribute("areaList", service.getAreaRandomList(domain.getAreaId()));// 사용자의 활동지역 기준 추천 모임

		return "index";
	}
}