package com.breaktheice.moimat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.breaktheice.moimat.service.MeetingService;

@Controller
@RequestMapping("/groups")
public class GroupsController {
	
	@Autowired
	private MeetingService service;

	@GetMapping("/{groupId}")
	public String getMoim(@PathVariable Long groupId,Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("id")==null) {
			return "redirect:/";
		}
		Long id = Long.parseLong(session.getAttribute("id").toString());
		
		model.addAttribute("meetList", service.getMeetList(groupId,id));
		return "/groups/groups";
	}
	
	@GetMapping("/{groupId}/calendar")
	public String getCalendar(@PathVariable Long groupId,Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("id", 1);
		return "/groups/groupCalendar";
	}
	
	@GetMapping("/{groupId}/meetings/new")
	public String meetingsNew() {
		return "/groups/new";
	}
	
	@GetMapping("/map")
	public String map() {
		return "/groups/selectmap";
	}
	
	@PostMapping("/{groupId}/meetings/new")
	public String meetingsNew2() {
		return "/groups/new";
	}
}
