package com.breaktheice.moimat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.service.QnaService;
import com.breaktheice.moimat.util.AdminCriteria;
import com.breaktheice.moimat.util.AdminPageDTO;

@Controller
public class QnaController {
	
//	1. 앱에 관한 문의 작성 기능
//	2. 이용자가 작성한 문의 내역 및 답변 확인 가능
	
	@Autowired QnaService service;
	
	// QNA 1대1 문의사항만 체크
	@GetMapping(value= {"/users/{memId}/qna", "/users/{memId}/qna/", "/users/{memId}/qna/list"})
	public String userQna(Model model, AdminCriteria cri, @PathVariable("memId") Long memId) {
		
		cri.setBrdId(3L);// qna
		System.out.println(cri);
		System.out.println(memId);
		//총 게시글 수
		Long totalCount = service.myqnaTotalCount(cri, memId);
		//게시글 리스트
		List<PostDomain> postList = service.myqnaList(cri, memId);
		
		
		model.addAttribute("postList", postList);
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		
		
		return "/info/myqna/list";
	}

	// qna 상세
	@RequestMapping("/users/{memId}/qna/{postId}/view")
	public String qnaView(Model model, PostDomain domain, AdminCriteria cri) {
		//조회수 증가
		service.viewCount(domain);

		Long totalCount = service.myqnaTotalCount(cri, domain.getMemId());
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//검색정보 및 페이지 정보
		model.addAttribute("view", service.view(domain));
		model.addAttribute("answer", service.isReply(domain));
		
		return "/info/myqna/view";
	}

	// qna 작성화면
	@GetMapping("/users/{memId}/qna/new")
	public String add(Model model, PostDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		Long totalCount = service.myqnaTotalCount(cri, domain.getMemId());
		
		//페이지 정보
		rttr.addAttribute("brdId",cri.getBrdId());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "/info/myqna/write";
	}
	// qna 작성 쿼리실행
	@PostMapping("/users/{memId}/qna/new")
	public String addQuery(Model model, PostDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		domain.setBrdId(3L);
		domain.setPostReply("Q");
		domain.setPostDepth(0L);
		// 게시글 등록 성공시 1이상 반환
		Long result = service.add(domain);
		
		//페이지 정보
		rttr.addAttribute("brdId",cri.getBrdId());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		String viewPage = "/users/"+domain.getMemId()+"/qna";
		return "redirect:"+viewPage;
	}
	@GetMapping("/users/{memId}/qna/{postId}/edit")
	public String edit(Model model, PostDomain domain, AdminCriteria cri) {
		model.addAttribute("view", service.view(domain));
		return "/info/myqna/update";
	}
	//  수정
	@PostMapping("/users/{memId}/qna/edit")
	public String updateQuery(Model model, PostDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		//수정
		service.update(domain);
		
		//페이지 정보
		rttr.addAttribute("brdId",cri.getBrdId());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		String viewPage = "/users/"+domain.getMemId()+"/qna";
		return "redirect:"+viewPage;
	}
	

	// 게시글 삭제
	@PostMapping("/users/{memId}/qna/delete")
	public String remove(Model model, PostDomain domain, AdminCriteria cri, RedirectAttributes rttr) {
		//삭제
		service.remove(domain);
		//페이지 정보
		rttr.addAttribute("brdId",cri.getBrdId());
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		String viewPage = "/users/"+domain.getMemId()+"/qna";
		return "redirect:"+viewPage;
	}
	
}
