package com.breaktheice.moimat.controller;

import com.breaktheice.moimat.service.TeamCommentsService;
import com.breaktheice.moimat.service.TeamPhotoService;
import com.breaktheice.moimat.service.TeamService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
}