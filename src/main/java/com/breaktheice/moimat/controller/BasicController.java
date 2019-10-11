package com.breaktheice.moimat.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.breaktheice.moimat.domain.BasicDomain;
import com.breaktheice.moimat.page.Criteria;
import com.breaktheice.moimat.page.PageMaker;
import com.breaktheice.moimat.service.BasicService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BasicController {

	@Autowired
	private BasicService service;
	//처음화면 boardlist.jsp 연동  page 패키지 페이징 연동
	@RequestMapping("/boardlist")
	public String boardlist(Criteria criteria, Model model) throws Exception {
		System.out.println("list2()");

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(criteria);

		System.out.println(criteria.getPerPageNum());
		System.out.println(criteria.getPage());

		int totalCount = service.selectAllBoard();
		System.out.println(totalCount);
		System.out.println("��ü �Խù� ���� ����:" + totalCount);
		pageMaker.setTotalCount(totalCount);

		List<BasicDomain> boardList = service.selectBoardListPage(criteria);
		model.addAttribute("list", service.selectBoardList());
		model.addAttribute("list", boardList);
		model.addAttribute("pageMaker", pageMaker);

		 return "boardlist";
	}
	//모임 게시물 수정 화면 보여주는역할
	@PostMapping("/boardmodify")	
	public String boardmodify(
			Model model,HttpServletRequest request,BasicDomain domain) {	
			System.out.println("modifyddddddddddddddddddddd");
		
			int postId = Integer.parseInt(request.getParameter("postId"));
			System.out.println(postId);
			model.addAttribute("list", service.selectBoardOne(postId));
				System.out.println("테스트"+postId);
				
		return "boardmodify";
	}  
	// 게시물 수정 된 글작성 
	@PostMapping("/boardmodifywrite")	
	public String boardmodifywrite(
			Model model,HttpServletRequest request,BasicDomain domain) {	
		
			service.modifyBoard(domain);
				
		return "redirect:/boardlist";
	}
	//글쓰는 화면 보여줌 필요한 더미데이터 domain.set으로 일단 넣었음
	@RequestMapping(value="/boardwriteview", method= RequestMethod.GET)	
	public String boardwriteview(BasicDomain domain, Model model,HttpServletRequest request) {
		System.out.println("/boardwrite GET");
		
		domain.setTeamId(8);
		domain.setBrdId(28);
		domain.setTmemId(6);
		domain.setPostTmemLevel(1);
		domain.setPostNickname("testNi");
		domain.setPostEmail("Email");	

		model.addAttribute("list",domain);
			
		return "boardwrite";
	}
	//게시물 생성
	@RequestMapping(value="/boardwrite", method= RequestMethod.POST)	
	public String boardwrite(
			BasicDomain domain,Model model) {
		System.out.println("/boardwrite POST");
	
		service.insertBoard(domain);	
		System.out.println(domain);
		return "redirect:/boardlist";
	}
	//게시물 삭제
	@GetMapping("/deleteboard")
	public String deleteboard(Model model,
			HttpServletRequest request, BasicDomain domain) throws Exception {
		System.out.println("delete");

		service.deleteBoard(domain); 
		return "redirect:boardlist";
	}
	//게시물 상세 확인 댓글 list와 댓글 등록까지
	@RequestMapping("/boardcontentview")	
	public String boardcontentview(
			Model model, BasicDomain domain) {	

		System.out.println("테스트"+domain);
		
		long postId = domain.getPostId();
		long tmemId = domain.getTmemId();
		//조회수 올려주는 메서드
		service.updateViewCnt(domain);
		// 게시글 목록 
		model.addAttribute("list", service.selectBoardOne(postId));
		
		// 게시글의 덧글 목록
		model.addAttribute("list2",service.selectReplyList(domain)); 
		
		
		System.out.println("테스트"+postId);
		System.out.println("테트"+tmemId);
		
	
		return "boardcontentview";
	}
	//댓글 생성
	@PostMapping("/reply")
	public String reply(BasicDomain domain,
			Model model, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		int postId = Integer.parseInt(request.getParameter("postId"));
		System.out.println(postId);
		domain.setBrdId(28);
		domain.setCmtNickname("testNickname");
		domain.setCmtEmail("testEmail");
		domain.setTmemId(6);
		System.out.println(domain);
		service.replyBoard(domain);
		
		rttr.addFlashAttribute(domain);

		return "redirect:/boardcontentview";
	}
	//댓글삭제
	@GetMapping("/replydelete")
	public String replydelete(BasicDomain domain,Model model,
			HttpServletRequest request,RedirectAttributes rttr) {
		System.out.println("replydelete()");
		service.replydeleteBoard(domain);
		rttr.addFlashAttribute(domain);
		System.out.println(domain);
		System.out.println("reply()"+domain);
//		삭제는 되는대 삭제하고 바로 contentview 보여줘야하는데 이부분이 구현안됨
		return "redirect:/boardcontentview";
	}
	@GetMapping("/replymodify")
	public String replymodify(BasicDomain domain,
			Model model, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
	
		long cmtId = domain.getCmtId();
		System.out.println("cmtID테스트"+cmtId);
		service.replyUPBoard(domain);
		
		rttr.addFlashAttribute(domain);

		return "redirect:/boardcontentview";
	}


}