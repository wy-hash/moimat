package com.breaktheice.moimat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.breaktheice.moimat.service.*;
import com.breaktheice.moimat.chat.ChatRoom;
import com.breaktheice.moimat.chat.ChatRoomManager;
import com.breaktheice.moimat.domain.*;
import com.breaktheice.moimat.service.TeamChatService;
import com.breaktheice.moimat.service.TeamCommentsService;
import com.breaktheice.moimat.service.TeamMemberService;
import com.breaktheice.moimat.service.TeamPhotoService;
import com.breaktheice.moimat.service.TeamPostService;
import com.breaktheice.moimat.service.TeamService;
import com.breaktheice.moimat.util.AdminCriteria;
import com.breaktheice.moimat.util.AdminPageDTO;

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
	
	@Autowired 
	private TeamMemberService teamMemberService;

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
	public String groupMain(@PathVariable Long groupId, Model model, HttpSession session) {
		//모임 탭 분기를 위한 tmem 정보 
		MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		
		String msg = (String) session.getAttribute("msg");
		
		if (!( msg == null || msg.length()<=0)) {//메세지가 있을 때
			model.addAttribute("msg", msg);
			session.setAttribute("msg","");
		}
		TeamDomain td = teamService.getGroupInfo(groupId);
		if (md != null && md.getMemId() >0) {
			model.addAttribute("tmem", teamMemberService.getTeamMemberId(groupId, md.getMemId()));
		}
		
		model.addAttribute("group",td);
		model.addAttribute("teamInfo",teamService.settingTeamInfoVO(td));
		return "groups/group-home";
	}

	@GetMapping("/{groupId}/member")
	public String member(@PathVariable Long groupId, Model model, HttpSession session) {
		//모임 탭 분기를 위한 tmem 정보 
		MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		if (md != null && md.getMemId() >0) {
			model.addAttribute("tmem", teamMemberService.getTeamMemberId(groupId, md.getMemId()));
		}
		
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		return "groups/member";
	}

	@GetMapping("/{groupId}/schedule")
	public String schedule(@PathVariable Long groupId, Model model, HttpSession session) {
		//모임 탭 분기를 위한 tmem 정보 
		MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		if (md != null && md.getMemId() >0) {
			model.addAttribute("tmem", teamMemberService.getTeamMemberId(groupId, md.getMemId()));
		}
		
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		return "groups/schedule";
	}

	@GetMapping("/{groupId}/photos")
	public String photos(@PathVariable Long groupId, Model model,AdminCriteria cri,  HttpSession session) {

		//모임 탭 분기를 위한 tmem 정보 
		MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		if (md != null && md.getMemId() >0) {
			model.addAttribute("tmem", teamMemberService.getTeamMemberId(groupId, md.getMemId()));
		}
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		//사진게시판 ID 22
		cri.setBrdId(22L);
		//페이지당 갯수는 10개 고정
		cri.setAmount(6L);
		List<TeamPostDomain> posts = teamPhotoService.getAllPosts(groupId,cri);
		
		teamPhotoService.getThumbnail(posts);

		teamCommentsService.addNumOfComments(posts);
		Long total = teamPostService.getTotalCount(groupId, cri);
		model.addAttribute("posts", posts);
		model.addAttribute("pageMaker",new AdminPageDTO(cri,total));

		return "groups/photos/list";
	}

	@GetMapping("/{groupId}/posts")
	public String posts(@PathVariable Long groupId, Model model,AdminCriteria cri, HttpSession session) {
		//모임 탭 분기를 위한 tmem 정보 
		MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		if (md != null && md.getMemId() >0) {
			model.addAttribute("tmem", teamMemberService.getTeamMemberId(groupId, md.getMemId()));
		}
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		//일반게시판 ID 23
		cri.setBrdId(23L);
		//페이지당 갯수는 10개 고정
		cri.setAmount(10L);
		List<TeamPostDomain> posts = teamPostService.getAllPosts(groupId, cri);
		Long total = teamPostService.getTotalCount(groupId, cri);
		teamCommentsService.addNumOfComments(posts);
		model.addAttribute("posts", posts);
		model.addAttribute("pageMaker",new AdminPageDTO(cri,total));

		return "groups/posts/list";
	}

	@GetMapping("/{groupId}/chat")
	public String chat(@PathVariable Long groupId, Model model, HttpSession session) {
		//모임 탭 분기를 위한 tmem 정보 
		MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		if (md != null && md.getMemId() >0) {
			model.addAttribute("tmem", teamMemberService.getTeamMemberId(groupId, md.getMemId()));
		}
		
		ChatRoom room = chatRoomManager.getChatRoom(groupId);

		model.addAttribute("chatRoom", room);
		TeamMemberDomain d = teamMemberService.getTeamMemberId(groupId, md.getMemId());
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		model.addAttribute("messages", teamChatService.getMessages(groupId));

		model.addAttribute("tmemId", d.getTmemId());



		return "groups/chat";
	}
	
	@GetMapping("/{groupId}/settings")
	public String settings(@PathVariable Long groupId, Model model, HttpSession session) {
		//모임 탭 분기를 위한 tmem 정보 
		MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
		if (md != null && md.getMemId() >0) {
			model.addAttribute("tmem", teamMemberService.getTeamMemberId(groupId, md.getMemId()));
		}
		
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		return "groups/settings";

	}
	
	
}
