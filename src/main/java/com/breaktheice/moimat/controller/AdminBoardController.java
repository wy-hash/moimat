package com.breaktheice.moimat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.breaktheice.moimat.domain.BoardDomain;
import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.service.AdminBoardService;
import com.breaktheice.moimat.util.AdminCriteria;
import com.breaktheice.moimat.util.AdminPageDTO;

@Controller
@RequestMapping("/admin/board")
public class AdminBoardController {
	
	@Autowired
	private AdminBoardService service;

	
	//게시판 목록출력 
	@RequestMapping(value = {"", "list"})
	public String list(Model model, AdminCriteria cri) throws Exception{
		System.out.println("list()");
		
		List<BoardDomain> list = service.list(cri);
		Long totalCount = service.totalCount(cri);
		
		
		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		model.addAttribute("list", list);
		
		return "/admin/board/list";
	}
	
	//게시판 등록
	@RequestMapping(value="new", method = RequestMethod.GET)
	public String add() throws Exception{
		System.out.println("add GET()");
		
		return "/admin/board/write";
	}
	
	//게시판 등록
	@RequestMapping(value="new", method = RequestMethod.POST)
	public String add(Model model, BoardDomain domain) throws Exception{
		System.out.println("add POST()");
		System.out.println(domain);
		//게시판 등록 성공시 1 이상 반환
		Long result = service.add(domain);
		
		return "redirect:/admin/board";
	}
	
	//게시판 상세
	@RequestMapping("view/{brdId}")
	public String view(Model model, BoardDomain domain) throws Exception{
//		System.out.println(domain.getIntId());
		
		//게시판 상세
		BoardDomain result = service.view(domain);

		model.addAttribute("view", result);
		
		return "/admin/board/view";
	}
	//게시판 수정
	@RequestMapping(value="edit/{brdId}", method = RequestMethod.GET)
	public String update(Model model, BoardDomain domain) throws Exception{
		//게시판 수정
		BoardDomain result = service.view(domain);

		model.addAttribute("view", result);
		
		return "/admin/board/update";
	}
	
	//게시판 수정
	@RequestMapping(value="edit", method = RequestMethod.POST)
	public String updateQuery(Model model, BoardDomain domain) throws Exception{
		
		System.out.println(domain);
		
		//게시판 수정성공시 1이상반환
		Long result = service.update(domain);
		
		return "redirect:/admin/board";
	}
	
	
	//게시판 삭제
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String remove(Model model, BoardDomain domain) throws Exception{
		
		//게시판 삭제성공시 1이상반환
		Long result = service.remove(domain);
		
		return "redirect:/admin/board";
	}
	
	//게시판 코드 중복체크  -> true : 중복 값 없음 / false : 중복 값 있음
	@RequestMapping(value="keyCheck",method=RequestMethod.POST )
	@ResponseBody
	public String keyCheck(BoardDomain domain) throws Exception{
		
		return service.keyCheck(domain)+"";
	}
	
}
