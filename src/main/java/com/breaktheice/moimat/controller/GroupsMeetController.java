package com.breaktheice.moimat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	@GetMapping("/{groupId}/meetings/new")
	public String meetingsNew(@PathVariable Long groupId) {
		return "/groups/new";
	}

	@GetMapping("/map")
	public String map() {
		return "/groups/selectmap";
	}

	@PostMapping("/{groupId}/meetings/new")
	public String meetingsNew2(MeetVO meetVO, @PathVariable Long groupId, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Long id = Long.parseLong(session.getAttribute("id").toString());
		service.createMeet(meetVO, groupId, id);
		return "redirect:/groups/" + groupId + "/calendar";
	}

	@PostMapping("/{groupId}/meetings/delete")
	public String meetDelete(@PathVariable Long groupId, @RequestParam("meetId") Long meetId,
			HttpServletRequest request) {
		service.deleteMeet(meetId);
		return "redirect:/groups/" + groupId + "/calendar";
	}
}
