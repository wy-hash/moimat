package com.breaktheice.moimat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.TeamCommentsDTO;
import com.breaktheice.moimat.domain.TeamCommentsDomain;
import com.breaktheice.moimat.domain.TeamMemberDomain;
import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.service.AuthService;
import com.breaktheice.moimat.service.TeamCommentsService;
import com.breaktheice.moimat.service.TeamMemberService;
import com.breaktheice.moimat.service.TeamPhotoService;
import com.breaktheice.moimat.service.TeamPostService;
import com.breaktheice.moimat.service.TeamService;
import com.breaktheice.moimat.util.AdminCriteria;
import com.google.gson.Gson;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/groups/{groupId}/photos")
@Log4j
public class PhotosController {

	@Autowired
	private TeamService teamService;

	@Autowired
	private TeamPhotoService teamPhotoService;

	@Autowired
	private TeamCommentsService teamCommentsService;

	@Autowired
	private TeamMemberService teamMemberService;

	@Autowired
	private TeamPostService teamPostService;

	@Autowired
	private AuthService authService;

	@GetMapping("/new")
	public String createPost(@PathVariable("groupId") Long groupId, Model model) {

		model.addAttribute("group", teamService.getGroupInfo(groupId));
		return "/groups/photos/new";
	}

	@GetMapping("/{postId}")
	public String readPost(@PathVariable("groupId") Long groupId,
						   @PathVariable("postId") Long postId,
						   Model model,
						   @ModelAttribute("cri")AdminCriteria cri,
						   @SessionAttribute("loginVO") MemberDomain loginVO) {
		teamPostService.updateViewCount(postId);

		TeamPostDomain post = teamPostService.getPost(postId, 22L);

		model.addAttribute("group", teamService.getGroupInfo(groupId));

		model.addAttribute("post", post);

		List<TeamCommentsDTO> comments = teamCommentsService.getAllComments(postId);

		for (TeamCommentsDTO dto: comments) {
			dto.setMemId(teamMemberService.getMember(dto.getTmemId()).getMemId());
		}
		model.addAttribute("comments", comments);


		MemberDomain postingUser = authService.getMemberInfo(teamMemberService.getMember(post.getTmemId()).getMemId());
		model.addAttribute("user", postingUser);

		TeamMemberDomain member = teamMemberService.getTeamMemberId(groupId, loginVO.getMemId());
		log.info("member: " + member);
		model.addAttribute("tmemId", member.getTmemId());



		return "/groups/photos/read";
	}

	@PostMapping(value = "/{postId}/comment", consumes = "application/x-www-form-urlencoded;charset=UTF-8", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String writeComment(@PathVariable("postId") Long postId, TeamCommentsDomain comment) {

		Long cmtId = 0L;
		if (teamCommentsService.writeComment(comment) == 1) {
			cmtId = comment.getCmtId();
		}

		TeamCommentsDTO result = teamCommentsService.getCommentById(cmtId);
		log.info(result);

		return new Gson().toJson(result);
	}

	@PostMapping({"/new"})
	public String uploadPost(@PathVariable("groupId") Long groupId, TeamPostDomain post, @RequestParam("memId") Long memId) {
		log.info("post: " + post);

		log.info(groupId);
		log.info(memId);
		TeamMemberDomain member =  teamMemberService.getTeamMemberId(groupId, memId);
		log.info("member: " + member);
		post.setTmemId(member.getTmemId());
		post.setPostTmemLevel(member.getTmemLevel());

		Long postId = teamPostService.writePost(post);
		log.info("postId: " + postId);

		String returnPath = "/groups/" + groupId + "/photos/" + postId;

		return "redirect:" + returnPath;
	}

	@GetMapping("/{postId}/edit")
	public String editPost(@PathVariable("postId") Long postId, @PathVariable("groupId") Long groupId, Model model,@ModelAttribute("cri")AdminCriteria cri) {

		model.addAttribute("post", teamPostService.getPost(postId, 22L));
		model.addAttribute("group",teamService.getGroupInfo(groupId));

		return "/groups/photos/edit";
	}

	@PostMapping("/{postId}/edit")
	public String editPost(@PathVariable("postId") Long postId, @PathVariable("groupId") Long groupId, TeamPostDomain post, @RequestParam("memId") Long memId,@ModelAttribute("cri")AdminCriteria cri,RedirectAttributes rttr) {
//		log.info("post: " + post);
//
//		log.info(groupId);
//		log.info(memId);
//		TeamMemberDomain member =  teamMemberService.getTeamMemberId(groupId, memId);
//		log.info("member: " + member);
//		post.setTmemId(member.getTmemId());
//		post.setPostTmemLevel(member.getTmemLevel());
//
//		Long postId = teamPostService.writePost(post);
//		log.info("postId: " + postId);
//
//		String returnPath = "/groups/" + groupId + "/photos/" + "postId";

		TeamPostDomain originPost = teamPostService.getPost(postId, 22L);
		originPost.setPostTitle(post.getPostTitle());
		originPost.setPostContent(post.getPostContent());

		teamPostService.updatePost(originPost);
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/groups/" + groupId + "/photos/" + postId;
	}

	@GetMapping("/{postId}/delete")
	public String deletePost(@PathVariable("groupId") Long groupId, @PathVariable("postId") Long postId,@ModelAttribute("cri")AdminCriteria cri,RedirectAttributes rttr) {

		teamPostService.deletePost(postId);
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/groups/" + groupId + "/photos";
	}

	@RequestMapping(value="/{postId}/comment/mod",method=RequestMethod.POST, consumes = "application/x-www-form-urlencoded;charset=UTF-8", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String modComment(TeamCommentsDomain domain) {

		log.info("덧글 수정실행" + domain);

		String result = "{\"postId\": 0}";

		if(teamCommentsService.modComment(domain) >0L) {
			result = new Gson().toJson(teamCommentsService.getCommentById(domain.getCmtId()));
		}

		return result;
	}

	@RequestMapping(value="/{postId}/comment/del",method=RequestMethod.POST, consumes = "application/x-www-form-urlencoded;charset=UTF-8", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String delComment(TeamCommentsDomain domain) {

		log.info("덧글 삭제" + domain);

		String result = "{\"result\": false}";

		if(teamCommentsService.deleteComment(domain) >0L) {
			result = "{\"result\": true}";
		}

		return result;
	}

}