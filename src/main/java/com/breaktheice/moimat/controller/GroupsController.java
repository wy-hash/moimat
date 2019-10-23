package com.breaktheice.moimat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.breaktheice.moimat.domain.TeamMemberDomain;
import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.service.TeamChatService;
import com.breaktheice.moimat.service.TeamCommentsService;
import com.breaktheice.moimat.service.TeamMemberService;
import com.breaktheice.moimat.service.TeamPhotoService;
import com.breaktheice.moimat.service.TeamPostService;
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
	
	@Autowired 
	private TeamMemberService teamMemberService;

	private final ChatRoomManager chatRoomManager;

	@Autowired
	private TeamPhotoService teamPhotoService;

	@Autowired
	private TeamCommentsService teamCommentsService;

	@Autowired
	private TeamPostService teamPostService;
	
	@GetMapping(value= {"","/"})
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
	public String addQuery(Model model, TeamDomain domain, AdminCriteria cri, RedirectAttributes rttr, HttpSession session) {
		
		MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		
		log.info(""+domain);
		
		// 모임 등록 성공시 1이상 반환
		Long result = teamService.add(domain, md);
		
		
		return "redirect:/groups";
	}
	

	@GetMapping("/{groupId}")
	public String groupMain(@PathVariable Long groupId, Model model, HttpSession session) {
		//모임 탭 분기를 위한 tmem 정보 
		MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		
		String msg = (String) session.getAttribute("msg");
		
		if (!( msg == null || msg.length()<=0)) {//메세지가 있을 때
			model.addAttribute("msg", msg);
			session.setAttribute("msg","");
		}
		
		model.addAttribute("tmem", teamMemberService.getTeamMemberId(groupId, md.getMemId()));
		
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		return "groups/group-home";
	}

	@GetMapping("/{groupId}/member")
	public String member(@PathVariable Long groupId, Model model, HttpSession session) {
		//모임 탭 분기를 위한 tmem 정보 
		MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		model.addAttribute("tmem", teamMemberService.getTeamMemberId(groupId, md.getMemId()));
		
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		return "groups/member";
	}

	@GetMapping("/{groupId}/schedule")
	public String schedule(@PathVariable Long groupId, Model model, HttpSession session) {
		//모임 탭 분기를 위한 tmem 정보 
		MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		model.addAttribute("tmem", teamMemberService.getTeamMemberId(groupId, md.getMemId()));
		
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		return "groups/schedule";
	}

	@GetMapping("/{groupId}/photos")
	public String photos(@PathVariable Long groupId, Model model, HttpSession session) {
		//모임 탭 분기를 위한 tmem 정보 
		MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		model.addAttribute("tmem", teamMemberService.getTeamMemberId(groupId, md.getMemId()));
		
		model.addAttribute("group", teamService.getGroupInfo(groupId));

		List<TeamPostDomain> posts = teamPhotoService.getAllPosts(groupId,22L);
		teamPhotoService.getThumbnail(posts);

		teamCommentsService.addNumOfComments(posts);

		model.addAttribute("posts", posts);


		return "groups/photos/list";
	}

	@GetMapping("/{groupId}/posts")
	public String posts(@PathVariable Long groupId, Model model, HttpSession session) {
		//모임 탭 분기를 위한 tmem 정보 
		MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		model.addAttribute("tmem", teamMemberService.getTeamMemberId(groupId, md.getMemId()));
		
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		List<TeamPostDomain> posts = teamPostService.getAllPosts(groupId, 23L);
		teamCommentsService.addNumOfComments(posts);
		model.addAttribute("posts", posts);

		return "groups/posts/list";
	}

	@GetMapping("/{groupId}/chat")
	public String chat(@PathVariable Long groupId, Model model, HttpSession session) {
		//모임 탭 분기를 위한 tmem 정보 
		MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		model.addAttribute("tmem", teamMemberService.getTeamMemberId(groupId, md.getMemId()));
		
		ChatRoom room = chatRoomManager.getChatRoom(groupId);

		model.addAttribute("chatRoom", room);
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		model.addAttribute("messages", teamChatService.getMessages(groupId));

		return "groups/chat";
	}
	
	@GetMapping("/{groupId}/settings")
	public String settings(@PathVariable Long groupId, Model model, HttpSession session) {
		//모임 탭 분기를 위한 tmem 정보 
		MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		model.addAttribute("tmem", teamMemberService.getTeamMemberId(groupId, md.getMemId()));
		
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		return "groups/settings";

	}
	
	
}
