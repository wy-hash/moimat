package com.breaktheice.moimat.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.breaktheice.moimat.service.MeetingService;

@Controller
@RequestMapping("/groups")
public class GroupsController {
	
	@Inject
	private MeetingService service;

	@GetMapping("/{groupId}")
	public String getMoim(@PathVariable Long groupId,Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("id")==null) {
			return "redirect:/";
		}
		Long id = Long.parseLong(session.getAttribute("id").toString());
		
		model.addAttribute("meetlist", service.getMeetList(groupId,id));
		return "/groups/groups";
	}
	
}
