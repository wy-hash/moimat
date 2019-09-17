 package com.breaktheice.moimat.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.breaktheice.moimat.domain.PhotoDomain;
import com.breaktheice.moimat.service.PhotoService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class PhotoController {

	@Autowired
	private PhotoService service;
	
	// 사진첩 목록
	@GetMapping("/groups/{groupid}/photos")
	public String list(@PathVariable String groupid, Model model) {
		
		System.out.println("list()호출"); 
		
		model.addAttribute("domain", service.selectBoardList());
		
		return "list";
	}
	
	@GetMapping("/groups/{groupid}/photos")
    public String content_view(@PathVariable String groupid,Model model,HttpServletRequest request) throws Exception {

	model.addAttribute("content_view", service.selectBoardOne(groupid));
	
	return "content_view"; 		
}
	@GetMapping("/groups/{groupid}/photos")
	public String write_view(@PathVariable String groupid,Model model,HttpServletRequest request) throws Exception {
		System.out.println("write_view()");
		
		return "write_view"; 		
		}
	@GetMapping("/groups/{groupid}/photos")
	public String write(PhotoDomain domain,@PathVariable String groupid, Model model,HttpServletRequest request) throws Exception {
		System.out.println("write");	
//		model.addAttribute("write_view",boardService.selectBoardOne(bId));
		service.insertBoard(domain); 
		
		return "redirect:list"; 		
	}
	@GetMapping("/groups/{groupid}/photos/{photoid}/edit")
	public String delete(@PathVariable String groupid, @PathVariable String photoid ,Model model,HttpServletRequest request, PhotoDomain domain) throws Exception {
		System.out.println("delete");	
//		model.addAttribute("write_view",boardService.selectBoardOne(bId));
		int test = Integer.parseInt(photoid);
		domain.setSeq(test);
	
		service.deleteBoard(domain);
//		딜리티 메서드 팀 포스트 
//		딜리트 어태치 총 3개만들어서 각각 삭제되게 해야함 맵퍼와 서비스도 3개 선언 구현해야함
		
		return "redirect:list"; 		
	}
	@GetMapping("/groups/{groupid}/photos/{photoid}/edit")
	public String modify(PhotoDomain domain,@PathVariable String groupid, @PathVariable String photoid,Model model) {
		System.out.println("modify");
		
		service.modifyBoard(domain) ;
		
		return "redirect:list";	
	}
	@GetMapping("/group/{groupid}/photos/{photoid}/edit")
	public String reply_view(PhotoDomain domain,@PathVariable String groupid, @PathVariable String photoid, Model model,HttpServletRequest request) throws Exception {
		System.out.println("reply_view()");
		
		String gid = request.getParameter("groupid");
		String pid = request.getParameter("photoid");

		model.addAttribute("reply_view", service.selectBoardOne(gid));
		model.addAttribute("reply_view", service.selectBoardOne(pid));
		
		return "reply_view";
	}
	
	@GetMapping("/groups/{groupid}/photos/new")
	public String reply(PhotoDomain domain,@PathVariable String groupid,Model model,HttpServletRequest request) {
		System.out.println("reply()");
		
		
		service.replyUPBoard(domain);
		service.replyBoard(domain);
		
		return "redirect:list";
	
	
}
}
	
