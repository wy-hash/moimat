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

	@RequestMapping("/boardlist")	
	public String file(
			Model model,HttpServletRequest request,BasicDomain domain) {	
		System.out.println(domain);
		 
		model.addAttribute("list", service.selectBoardList());
		System.out.println(service.selectBoardList());
		
		
		return "boardlist";
	}
	
	@PostMapping("/boardmodify")	
	public String cont2(
			Model model,HttpServletRequest request,BasicDomain domain) {	
			System.out.println("modifyddddddddddddddddddddd");
		
			int postId = Integer.parseInt(request.getParameter("postId"));
			System.out.println(postId);
			model.addAttribute("list", service.selectBoardOne(postId));
				System.out.println("테스트"+postId);
				
		return "boardmodify";
	}  
	
	@PostMapping("/boardmodifywrite")	
	public String cont22(
			Model model,HttpServletRequest request,BasicDomain domain) {	
		
			service.modifyBoard(domain);
				
		return "redirect:/boardlist";
	}

	@RequestMapping(value="/boardwriteview", method= RequestMethod.GET)	
	public String test2(BasicDomain domain, Model model,HttpServletRequest request) {
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
	@RequestMapping(value="/boardwrite", method= RequestMethod.POST)	
	public String test22(
			BasicDomain domain,Model model) {
		System.out.println("/boardwrite POST");
	
		service.insertBoard(domain);	
		System.out.println(domain);
		return "redirect:/boardlist";
	}
	@GetMapping("/deleteboard")
	public String delete(Model model,
			HttpServletRequest request, BasicDomain domain) throws Exception {
		System.out.println("delete");
//		model.addAttribute("write_view",boardService.selectBoardOne(bId));
	

		service.deleteBoard(domain);
		return "redirect:boardlist";
	}
	@RequestMapping("/boardcontentview")	
	public String cont(
			Model model, BasicDomain domain) {	
//		int postId = Integer.parseInt(request.getParameter("postId"));
		System.out.println("테스트"+domain);
		
		int postId = domain.getPostId();
		// 게시글 목록 
		model.addAttribute("list", service.selectBoardOne(postId));
		// 게시글의 덧글 목록
		model.addAttribute("list2",service.selectReplyList(domain));
		
		System.out.println("테스트"+postId);
		
	
		return "boardcontentview";
	}
	@PostMapping("/reply")
	public String reply_view(BasicDomain domain,
			Model model, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		int postId = Integer.parseInt(request.getParameter("postId"));
		System.out.println(postId);
		domain.setBrdId(28);
		domain.setCmtNickname("testNickname");
		domain.setCmtEmail("testEmail");
		domain.setTmemId(6);
		service.replyBoard(domain);
		
		rttr.addFlashAttribute(domain);

		return "redirect:/boardcontentview";
	}

	@RequestMapping("/list22")
	public void list3(Criteria criteria, Model model) throws Exception {
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

		model.addAttribute("list", boardList);
		model.addAttribute("pageMaker", pageMaker);

		// return "redirect:list";
	}
	// 사진첩 목록
	@GetMapping("/groups/{groupid}/photos11")
	public String list(@PathVariable String groupid, Model model) {

		System.out.println("list()호출");

//		model.addAttribute("domain", service.selectBoardList());

		return "list";
	}

	@GetMapping("/groups/{groupid}/photos22")
	public String content_view(@PathVariable String groupid, Model model, HttpServletRequest request) throws Exception {

		//model.addAttribute("content_view", service.selectBoardOne(groupid));

		return "content_view";
	}

	@GetMapping("/groups/{groupid}/photos33")
	public String write_view(@PathVariable String groupid, Model model, HttpServletRequest request) throws Exception {
		System.out.println("write_view()");

		return "write_view";
	}



	@GetMapping("/groups/{groupid}/photos/{photoid}/replies/new1")
	public String replyBoard(BasicDomain domain, @PathVariable String groupid, Model model,
			HttpServletRequest request) {
		System.out.println("reply()");

		service.replyUPBoard(domain);
		service.replyBoard(domain);

		return "redirect:list";
	}
	

	@GetMapping("/replydelete1")
	public String BasicReplydeleteBoard(BasicDomain domain, @PathVariable String groupid, Model model,
			HttpServletRequest request) {
		System.out.println("reply()");

		service.replydeleteBoard(domain);

		return "redirect:list";
	}



}