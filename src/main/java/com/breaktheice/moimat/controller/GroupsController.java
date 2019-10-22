package com.breaktheice.moimat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.breaktheice.moimat.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.breaktheice.moimat.chat.ChatRoom;
import com.breaktheice.moimat.chat.ChatRoomManager;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.TeamDomain;
import com.breaktheice.moimat.domain.TeamPostDomain;
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

	@Autowired
	private TeamCommentsService teamCommentsService;

	@Autowired
	private TeamPostService teamPostService;

	@Autowired
	private FileUploadService fileUploadService;
	
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
	@ResponseBody
	public String addQuery(Model model, TeamDomain domain, AdminCriteria cri, RedirectAttributes rttr, HttpSession session,
						   @RequestParam(value = "file", required = false) MultipartFile file) {
		
		MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		
		log.info(""+domain);


		String uploadPath = "";

		if (file.getSize() <= 0) {
			String randomImage = String.valueOf((int)(Math.random() * 10) + 1) + ".png";
			uploadPath = "resources/img/profile-photos/" + randomImage;

		} else {
			uploadPath = fileUploadService.saveFile("GROUP", file);
			uploadPath = uploadPath.replace("\\", "/");
		}

		domain.setTeamPhoto(uploadPath);


		
		// 모임 등록 성공시 1이상 반환
		Long result = teamService.add(domain, md);

		return "{\"result\": true, \"groupId\": " + result + "}";
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

		List<TeamPostDomain> posts = teamPhotoService.getAllPosts(groupId,22L);
		teamPhotoService.getThumbnail(posts);

		teamCommentsService.addNumOfComments(posts);

		model.addAttribute("posts", posts);


		return "groups/photos/list";
	}

	@GetMapping("/{groupId}/posts")
	public String posts(@PathVariable Long groupId, Model model) {
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		List<TeamPostDomain> posts = teamPostService.getAllPosts(groupId, 23L);
		teamCommentsService.addNumOfComments(posts);
		model.addAttribute("posts", posts);

		return "groups/posts/list";
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
