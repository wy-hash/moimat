package com.breaktheice.moimat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.service.AdminPostService;
import com.breaktheice.moimat.util.AdminCriteria;
import com.breaktheice.moimat.util.AdminPageDTO;

@Controller
@RequestMapping("/info")
public class InfoController {
	
	@Autowired
	private AdminPostService postService;
	
	//공지
	@RequestMapping(value= {"notice", "notice/list"})
	public String notice(Model model, AdminCriteria cri) {// 게시글 전체 관리 접속

		cri.setBrdId(1L);// 공지사항
		//총 게시글 수
		Long totalCount = postService.totalCount(cri);
		//게시글 리스트
		List<PostDomain> postList = postService.list(cri);
		
		model.addAttribute("postList", postList);
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		
		return "/info/notice/list";
	}
	// 공지사항 상세
	@RequestMapping("notice/{postId}/view")
	public String noticeView(Model model, PostDomain domain, AdminCriteria cri) {
		//조회수 증가
		postService.viewCount(domain);

		Long totalCount = postService.totalCount(cri);
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//검색정보 및 페이지 정보
		model.addAttribute("view", postService.view(domain));
		
		return "/info/notice/view";
	}
	
	// 이벤트
	@RequestMapping(value= {"event", "event/list"})
	public String event(Model model, AdminCriteria cri) {// 게시글 전체 관리 접속

		cri.setBrdId(2L);// 이벤트
		//총 게시글 수
		Long totalCount = postService.totalCount(cri);
		//게시글 리스트
		List<PostDomain> postList = postService.list(cri);
		
		model.addAttribute("postList", postList);
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		
		return "/info/event/list";
	}
	// 이벤트 상세
	@RequestMapping("event/{postId}/view")
	public String eventView(Model model, PostDomain domain, AdminCriteria cri) {
		//조회수 증가
		postService.viewCount(domain);

		Long totalCount = postService.totalCount(cri);
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//검색정보 및 페이지 정보
		model.addAttribute("view", postService.view(domain));
		
		return "/info/event/view";
	}
	

	// qna
	@RequestMapping(value= {"qna", "qna/list"})
	public String qna(Model model, AdminCriteria cri) {// 게시글 전체 관리 접속

		cri.setBrdId(3L);// qna
		//총 게시글 수
		Long totalCount = postService.totalCount(cri);
		//게시글 리스트
		List<PostDomain> postList = postService.list(cri);
		
		model.addAttribute("postList", postList);
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		
		return "/info/qna/list";
	}
	// qna 상세
	@RequestMapping("qna/{postId}/view")
	public String qnaView(Model model, PostDomain domain, AdminCriteria cri) {
		//조회수 증가
		postService.viewCount(domain);

		Long totalCount = postService.totalCount(cri);
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//검색정보 및 페이지 정보
		model.addAttribute("view", postService.view(domain));
		
		return "/info/qna/view";
	}
}
