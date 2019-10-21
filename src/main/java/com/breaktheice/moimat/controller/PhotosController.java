package com.breaktheice.moimat.controller;

import com.breaktheice.moimat.domain.TeamCommentsDomain;
import com.breaktheice.moimat.service.TeamCommentsService;
import com.breaktheice.moimat.service.TeamPhotoService;
import com.breaktheice.moimat.service.TeamService;
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

	@GetMapping("/new")
	public String createPost(@PathVariable("groupId") Long groupId, Model model) {
		
		return "/groups/photos/edit";
	}

	@GetMapping("/{postId}")
	public String readPost(@PathVariable("groupId") Long groupId,
						   @PathVariable("postId") Long postId,
						   Model model) {

		log.info(teamService.getGroupInfo(groupId));
		model.addAttribute("group", teamService.getGroupInfo(groupId));
		log.info(teamPhotoService.getPhoto(postId));
		model.addAttribute("post", teamPhotoService.getPhoto(postId));
		log.info(teamCommentsService.getAllComments(postId));
		model.addAttribute("comments", teamCommentsService.getAllComments(postId));



		return "/groups/photos/read";
	}

	@PostMapping(value = "/{postId2}/comment", consumes = "application/x-www-form-urlencoded;charset=UTF-8", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String writeComment(@PathVariable("postId2") Long postId2, TeamCommentsDomain comment) {

		Long cmtId = teamCommentsService.writeComment(comment);

		if (cmtId != 0L) {
			TeamCommentsDomain result = teamCommentsService.getCommentById(cmtId);

			return new Gson().toJson(result);
		}

		return "{\"msg\": \"false\"}";
	}
}