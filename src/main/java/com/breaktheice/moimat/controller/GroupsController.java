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
	
	@GetMapping("")
	public String index() {
		
		return "groups/index";
	}

	@GetMapping("/{groupId}")
	public String groupMain(@PathVariable Long groupId) {

		return "groups/group-home";
	}

	@GetMapping("/{groupId}/member")
	public String member(@PathVariable Long groupId) {
		return "groups/member";
	}

	@GetMapping("/{groupId}/schedule")
	public String schedule(@PathVariable Long groupId) {
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
	
	@GetMapping("/{groupId}/settings")
	public String settings(@PathVariable Long groupId) {

		return "groups/settings";

	}
	
}
