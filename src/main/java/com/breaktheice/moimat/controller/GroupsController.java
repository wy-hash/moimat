package com.breaktheice.moimat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.breaktheice.moimat.chat.ChatRoom;
import com.breaktheice.moimat.chat.ChatRoomManager;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.service.TeamChatService;
import com.breaktheice.moimat.service.TeamService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/groups")
@Log4j
@SessionAttributes("loginVO")
@RequiredArgsConstructor
public class GroupsController {

	@Autowired
	private TeamService teamService;
	@Autowired
	private TeamChatService teamChatService;

	private final ChatRoomManager chatRoomManager;

	
	@GetMapping("")
	public String index(@ModelAttribute("loginVO") MemberDomain member, Model model) {
		log.info("session value: " + member);
		model.addAttribute("groups", teamService.getJoinedGroupList(member));
		
		return "groups/index";
	}

	@GetMapping("/{groupId}")
	public String groupMain(@PathVariable Long groupId, Model model) {
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		return "groups/group-home";
	}

	@GetMapping("/{groupId}/member")
	public String member(@PathVariable Long groupId, Model model) {
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		return "groups/member";
	}

	@GetMapping("/{groupId}/schedule")
	public String schedule(@PathVariable Long groupId, Model model) {
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		return "groups/schedule";
	}

	@GetMapping("/{groupId}/photos")
	public String photos(@PathVariable Long groupId, Model model) {
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		return "groups/photos/list";
	}

	@GetMapping("/{groupId}/posts")
	public String posts(@PathVariable Long groupId, Model model) {
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		return "groups/posts";
	}

	@GetMapping("/{groupId}/chat")
	public String chat(@PathVariable Long groupId, Model model) {
		ChatRoom room = chatRoomManager.getChatRoom(groupId);

		model.addAttribute("chatRoom", room);
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		model.addAttribute("messages", teamChatService.getMessages(groupId));

		return "groups/chat";
	}
	
	@GetMapping("/{groupId}/settings")
	public String settings(@PathVariable Long groupId, Model model) {
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		return "groups/settings";

	}
	
}
