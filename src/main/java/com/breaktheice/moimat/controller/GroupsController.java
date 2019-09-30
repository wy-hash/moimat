package com.breaktheice.moimat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/groups")
public class GroupsController {
	

	@GetMapping("/{groupId}")
	public String index(@PathVariable Long groupId) {

		return "groups/index";
	}

	@GetMapping("/{groupId}/member")
	public String member(@PathVariable Long groupId) {

		return "groups/member";
	}

	@GetMapping("/{groupId}/schedule")
	public String schedule(@PathVariable Long groupId, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("id", 1); // 정모CRUD 임시용
		return "groups/schedule";
	}

	@GetMapping("/{groupId}/photos")
	public String photos(@PathVariable Long groupId) {

		return "groups/photos";
	}

	@GetMapping("/{groupId}/posts")
	public String posts(@PathVariable Long groupId) {

		return "groups/posts";
	}

	@GetMapping("/{groupId}/chat")
	public String chat(@PathVariable Long groupId) {

		return "groups/chat";

	}
	
	
	
}
