package com.breaktheice.moimat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.breaktheice.moimat.domain.BoardDomain;
import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.service.AdminBoardService;
import com.breaktheice.moimat.service.AdminPostService;
import com.breaktheice.moimat.util.AdminCriteria;
import com.breaktheice.moimat.util.AdminPageDTO;

@Controller
@RequestMapping("/admin/post")
public class AdminPostController {
	
	@Autowired
	private AdminBoardService boardService;
	@Autowired
	private AdminPostService postService;
	
	@RequestMapping(value= {"", "list"})
	public String post(Model model, AdminCriteria cri) {// 게시글 전체 관리 접속
		
		List<BoardDomain> boardList =  boardService.list();// 게시판 목록을 출력해 주기 위함
		
		if (cri.getBrdId() == null || cri.getBrdId() <= 0L) {//게시판의 번호가 없거나 0보다 낮을때 기본값으로 처음 게시판 선택
			if ( boardList != null && boardList.size()>0) {
				cri.setBrdId(boardList.get(0).getBrdId());
				}
		}
		
		System.out.println(cri);
		//총 게시글 수
		Long totalCount = postService.totalCount(cri);
		System.out.println(totalCount);
		//게시글 리스트
		List<PostDomain> postList = postService.list(cri);
		
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("postList", postList);
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		
		return "/admin/post/list";
	}
	
	// 게시글 작성화면
	@GetMapping("new")
	public String add(Model model, PostDomain domain, AdminCriteria cri) {
		
		System.out.println(domain.getBrdId());
		System.out.println(cri.getBrdId());
		

		Long totalCount = postService.totalCount(cri);
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		
		return "/admin/post/write";
	}
	// 게시글 작성 쿼리실행
	@PostMapping("new")
	public String addQuery(Model model, PostDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		System.out.println("add POST()");
		System.out.println(domain);
				
		// 게시글 등록 성공시 1이상 반환
		Long result = postService.add(domain);
		
		//페이지 정보
		rttr.addAttribute("brdId",cri.getBrdId());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		
		return "redirect:/admin/post"; 
	}
	
	// 게시글 상세
	@RequestMapping("{postId}/view")
	public String view(Model model, PostDomain domain, AdminCriteria cri) {
		//조회수 증가
		postService.viewCount(domain);

		Long totalCount = postService.totalCount(cri);
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//검색정보 및 페이지 정보
		
		model.addAttribute("view", postService.view(domain));
		
		return "/admin/post/view";
	}
	
	// 게시글 수정화면
	@GetMapping("{postId}/edit")
	public String update(Model model, PostDomain domain, AdminCriteria cri) {
		model.addAttribute("view", postService.view(domain));
		return "/admin/post/update";
	}
	
	// 게시글 수정
	@PostMapping("edit")
	public String updateQuery(Model model, PostDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		System.out.println("수정");		
		System.out.println(domain);
		//수정
		postService.update(domain);
		
		//페이지 정보
		rttr.addAttribute("brdId",cri.getBrdId());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/admin/post";
	}
	// 게시글 삭제
	@RequestMapping("delete")
	public String remove(Model model, PostDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		//삭제
		postService.remove(domain);
		//페이지 정보
		rttr.addAttribute("brdId",cri.getBrdId());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/admin/post";
	}
	// 답글작성 화면
	@GetMapping("{postId}/reply")
	public String reply(Model model, PostDomain domain, AdminCriteria cri) {
		model.addAttribute("view", postService.view(domain));
		return "/admin/post/reply";
	}
	// 답글작성 쿼리실행
	@PostMapping("reply")
	public String replyQuery(Model model, PostDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		System.out.println("reply POST()");
		System.out.println(domain);
		
		// 답글 작성시  Origin의 값 -> 현재 postId , depth + 1, reply 값 -> A
		domain.setPostOrigin(domain.getPostId());
		domain.setPostDepth(1L);
		domain.setPostReply("A");
		
		
		// 게시글 등록 성공시 1이상 반환
		Long result = postService.reply(domain);
		
		//페이지 정보
		rttr.addAttribute("brdId",cri.getBrdId());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		
		return "redirect:/admin/post";
	}
}
