package com.breaktheice.moimat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.service.AdminPostService;
import com.breaktheice.moimat.util.AdminCriteria;
import com.breaktheice.moimat.util.AdminPageDTO;

@Controller
@RequestMapping("/info")
public class InfoController {
	
	@Autowired
	private AdminPostService postService;
	
	//faq
	@RequestMapping(value= "faq")
	public String faq() {
		return "/info/faq";
	}
	
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
		model.addAttribute("answer", postService.isReply(domain));
		
		return "/info/qna/view";
	}

	// qna 작성화면
	@GetMapping("qna/new")
	public String add(Model model, PostDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		Long totalCount = postService.totalCount(cri);
		
		//페이지 정보
//		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		rttr.addAttribute("brdId",cri.getBrdId());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "/info/qna/write";
	}
	// qna 작성 쿼리실행
	@PostMapping("qna/new")
	public String addQuery(Model model, PostDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		domain.setBrdId(3L);
		domain.setPostReply("Q");
		domain.setPostDepth(0L);
		// 게시글 등록 성공시 1이상 반환
		Long result = postService.add(domain);
		
		//페이지 정보
		rttr.addAttribute("brdId",cri.getBrdId());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/info/qna";
	}
	
	@RequestMapping("qna/{postId}/edit")
	public String edit(Model model, PostDomain domain, AdminCriteria cri) {
		model.addAttribute("view", postService.view(domain));
		return "/info/qna/update";
	}
	//  수정
	@PostMapping("qna/edit")
	public String updateQuery(Model model, PostDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		//수정
		postService.update(domain);
		
		//페이지 정보
		rttr.addAttribute("brdId",cri.getBrdId());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/info/qna";
	}
	
	// 게시글 삭제
	@PostMapping("qna/delete")
	public String remove(Model model, PostDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		//삭제
		postService.remove(domain);
		//페이지 정보
		rttr.addAttribute("brdId",cri.getBrdId());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/info/qna";
	}
}
