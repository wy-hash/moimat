package com.breaktheice.moimat.controller;

import com.breaktheice.moimat.domain.*;
import com.breaktheice.moimat.service.*;
import com.google.gson.Gson;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/groups/{groupId}/posts")
@Log4j
public class TeamPostController {

    @Autowired
    private TeamPostService teamPostService;

    @Autowired
    private TeamService teamService;

    @Autowired
    private TeamCommentsService teamCommentsService;

    @Autowired
    private AuthService authService;

    @Autowired
    private TeamMemberService teamMemberService;

    @GetMapping("/{postId}")
    public String readPost(@PathVariable("groupId") Long groupId,
                           @PathVariable("postId") Long postId,
                           Model model) {

        teamPostService.updateViewCount(postId);

        TeamPostDomain post = teamPostService.getPost(postId, 23L);

        model.addAttribute("group", teamService.getGroupInfo(groupId));
        model.addAttribute("post", post);
        model.addAttribute("comments", teamCommentsService.getAllComments(postId));

        MemberDomain postingUser = authService.getMemberInfo(post.getTmemId());
        model.addAttribute("userImg", postingUser.getMemPhoto());

        return "/groups/posts/read";
    }

    @PostMapping(value = "/{postId}/comment", consumes = "application/x-www-form-urlencoded;charset=UTF-8", produces = "application/json; charset=utf-8")
    @ResponseBody
    public String writeComment(@PathVariable("postId") Long postId2, TeamCommentsDomain comment) {

        Long cmtId = teamCommentsService.writeComment(comment);

        if (cmtId != 0L) {
            TeamCommentsDTO result = teamCommentsService.getCommentById(cmtId);
            log.info(result);

            return new Gson().toJson(result);
        }

        return "{\"postId\": 0}";
    }

    @GetMapping("/new")
    public String createPost(@PathVariable("groupId") Long groupId, Model model) {

        model.addAttribute("group", teamService.getGroupInfo(groupId));
        return "/groups/posts/new";
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

        String returnPath = "/groups/" + groupId + "/posts/" + postId;

        return "redirect:" + returnPath;
    }

    @GetMapping("/{postId}/edit")
    public String editPost(@PathVariable("postId") Long postId, @PathVariable("groupId") Long groupId, Model model) {

        model.addAttribute("post", teamPostService.getPost(postId, 23L));
        model.addAttribute("group",teamService.getGroupInfo(groupId));

        return "/groups/posts/edit";
    }

    @PostMapping("/{postId}/edit")
    public String editPost(@PathVariable("postId") Long postId, @PathVariable("groupId") Long groupId, TeamPostDomain post, @RequestParam("memId") Long memId) {

        TeamPostDomain originPost = teamPostService.getPost(postId, 23L);
        originPost.setPostTitle(post.getPostTitle());
        originPost.setPostContent(post.getPostContent());

        teamPostService.updatePost(originPost);

        return "redirect:/groups/" + groupId + "/posts/" + postId;
    }

    @GetMapping("/{postId}/delete")
    public String deletePost(@PathVariable("groupId") Long groupId, @PathVariable("postId") Long postId) {

        teamPostService.deletePost(postId);

        return "redirect:/groups/" + groupId + "/post";
    }

}
