package com.breaktheice.moimat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.breaktheice.moimat.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.breaktheice.moimat.domain.MeetVO;
import com.breaktheice.moimat.service.MeetingService;

@Controller
@RequestMapping("/groups/{groupId}/schedule")
public class GroupsMeetController {
	@Autowired
	private MeetingService service;
	@Autowired
	TeamService teamService;

	@GetMapping("/new")
	public String meetingsNew(@PathVariable Long groupId, Model model) {
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		return "/groups/schedule/new";
	}

	@GetMapping("/map")
	public String map() {
		return "/groups/schedule/selectmap";
	}

	@PostMapping("/new")
	public String newMeet(MeetVO meetVO, @PathVariable Long groupId, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Long id = Long.parseLong(session.getAttribute("id").toString());
		service.createMeet(meetVO, groupId, id);
		return "redirect:/groups/" + groupId + "/schedule";
	}

	@PostMapping("/delete")
	public String meetDelete(@PathVariable Long groupId, @RequestParam("meetId") Long meetId,
			HttpServletRequest request) {
		service.deleteMeet(meetId);
		return "redirect:/groups/" + groupId + "/schedule";
	}
	
	@PostMapping("/meetmodify")
	public String updateMeet(@PathVariable Long groupId,MeetVO meetVO) {
		service.modifyMeet(meetVO);
		return "redirect:/groups/" + groupId + "/schedule";
	}
	
	@PostMapping("/modify")
	public String meetModify(@PathVariable Long groupId,@RequestParam("meetId")Long meetId, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Long id = Long.parseLong(session.getAttribute("id").toString());
		request.setAttribute("MeetVO", service.readMeet(meetId, groupId, id));
		return "/groups/schedule/meetModify";
	}
	
	@GetMapping("/cancel")
	public String cancelMeet(@PathVariable Long groupId,@RequestParam("meetid")Long meetId, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Long id = Long.parseLong(session.getAttribute("id").toString());
		service.cancelAttend(meetId, groupId, id);
		return "redirect:/groups/" + groupId + "/schedule";
	}
	
	@GetMapping("/attend")
	public String attendMeet(@PathVariable Long groupId,@RequestParam("meetid")Long meetId, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Long id = Long.parseLong(session.getAttribute("id").toString());
		service.attendMeet(meetId, groupId, id);
		return "redirect:/groups/" + groupId + "/schedule";
	}
	
}
