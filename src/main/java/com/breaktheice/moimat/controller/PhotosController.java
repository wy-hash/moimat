package com.breaktheice.moimat.controller;

import com.breaktheice.moimat.domain.*;
import com.breaktheice.moimat.service.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

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
						   Model model) {
		teamPostService.updateViewCount(postId);

		TeamPostDomain post = teamPostService.getPost(postId, 22L);

		model.addAttribute("group", teamService.getGroupInfo(groupId));

		model.addAttribute("post", post);

		model.addAttribute("comments", teamCommentsService.getAllComments(postId));


		MemberDomain postingUser = authService.getMemberInfo(post.getTmemId());
		model.addAttribute("userImg", postingUser.getMemPhoto());





		return "/groups/photos/read";
	}

	@PostMapping(value = "/{postId2}/comment", consumes = "application/x-www-form-urlencoded;charset=UTF-8", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String writeComment(@PathVariable("postId2") Long postId2, TeamCommentsDomain comment) {

		Long cmtId = teamCommentsService.writeComment(comment);

		if (cmtId != 0L) {
			TeamCommentsDTO result = teamCommentsService.getCommentById(cmtId);
			log.info(result);

			return new Gson().toJson(result);
		}

		return "{\"postId\": 0}";
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
	public String editPost(@PathVariable("postId") Long postId, @PathVariable("groupId") Long groupId, Model model) {

		model.addAttribute("post", teamPostService.getPost(postId, 22L));
		model.addAttribute("group",teamService.getGroupInfo(groupId));

		return "/groups/photos/edit";
	}

	@PostMapping("/{postId}/edit")
	public String editPost(@PathVariable("postId") Long postId, @PathVariable("groupId") Long groupId, TeamPostDomain post, @RequestParam("memId") Long memId) {
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

		return "redirect:/groups/" + groupId + "/photos/" + postId;
	}

	@GetMapping("/{postId}/delete")
	public String deletePost(@PathVariable("groupId") Long groupId, @PathVariable("postId") Long postId) {

		teamPostService.deletePost(postId);

		return "redirect:/groups/" + groupId + "/photos";
	}

	@RequestMapping(value="/{postId}/comment/mod",method=RequestMethod.POST )
	@ResponseBody
	public String modComment(TeamCommentsDomain domain) {
		
		log.info("덧글 수정실행" + domain);
		
		String result = "N";
		
		if(teamCommentsService.modComment(domain) >0L) {
			result = "Y";
		}
		
		return result;
	}
}