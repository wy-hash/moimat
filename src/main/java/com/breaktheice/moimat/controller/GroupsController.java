package com.breaktheice.moimat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.breaktheice.moimat.chat.ChatRoom;
import com.breaktheice.moimat.chat.ChatRoomManager;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.TeamDomain;
import com.breaktheice.moimat.service.TeamChatService;
import com.breaktheice.moimat.service.TeamPhotoService;
import com.breaktheice.moimat.service.TeamService;
import com.breaktheice.moimat.util.AdminCriteria;

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

	@Autowired
	private TeamPhotoService teamPhotoService;
	
	@GetMapping("")
	public String index(@ModelAttribute("loginVO") MemberDomain member, Model model) {
		log.info("session value: " + member);
		model.addAttribute("groups", teamService.getJoinedGroupList(member));
		
		return "groups/index";
	}
	
	//모임 등록
	@GetMapping("new")
	public String add(Model model, TeamDomain domain) {

		model.addAttribute("areas", teamService.selectAllAreas());
	 	model.addAttribute("interest", teamService.selectAllInterest());
		
		return "groups/new";
	}
	// 모임 등록 쿼리실행
	@PostMapping("new")
	public String addQuery(Model model, TeamDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		// 모임 등록 성공시 1이상 반환
		Long result = teamService.add(domain);
		
		return "redirect:/groups";
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
		model.addAttribute("posts", teamPhotoService.getAllPosts(groupId));

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
