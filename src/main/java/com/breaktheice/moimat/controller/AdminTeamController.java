package com.breaktheice.moimat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.breaktheice.moimat.domain.TeamDomain;
import com.breaktheice.moimat.service.AdminTeamService;
import com.breaktheice.moimat.util.AdminCriteria;
import com.breaktheice.moimat.util.AdminPageDTO;

@Controller
@RequestMapping("/admin/groups")
public class AdminTeamController {
	
	@Autowired
	private AdminTeamService service;
	
	@RequestMapping(value= {"","list"})
	public String list(Model model, AdminCriteria cri) {

		System.out.println(cri);
		// 총 모임 수
		Long totalCount = service.totalCount(cri);
		System.out.println(totalCount);
		// 모임 리스트
		List<TeamDomain> teamList = service.list(cri);

		model.addAttribute("teamList", teamList);
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		
		return "/admin/groups/list";
	}
	

}
