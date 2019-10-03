package com.breaktheice.moimat.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.breaktheice.moimat.domain.PhotoDomain;
import com.breaktheice.moimat.page.Criteria;
import com.breaktheice.moimat.page.PageMaker;
import com.breaktheice.moimat.service.PhotoService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
/* @RequestMapping("/groups/{groupId}/post") */
public class PhotoController {

	@Autowired
	private PhotoService service;

//	@RequestMapping( "/test" )
//	public String file(
//			Model model,HttpServletRequest request) {
//		
//		String title = request.getParameter("title");
//		
//		model.addAttribute("title", title);
//		
//	
//		return "fileuploadwrite";
//	}

	
	@RequestMapping("/filelistview")
	public String test(Model model, List<MultipartFile> file, PhotoDomain domain, @RequestParam("title") String title,
			HttpServletRequest request) {

		// service.insertBoard(domain);
		String text = request.getParameter("text");

		model.addAttribute("title", title);
		model.addAttribute("text", text);
		// 더미데이터 넣어줘야함

//		service.insertBoard(domain); 

		return "filelistview";
	}
	
	@RequestMapping(value="/fileuploadwrite", method=RequestMethod.GET)
	public String upload1(Model model, @RequestParam(required = false) List<MultipartFile> file, PhotoDomain domain,
			HttpServletRequest request) {
		return "fileuploadwrite";
	}
	
	@RequestMapping(value="/fileuploadwrite", method=RequestMethod.POST)
	public String upload2(Model model, @RequestParam(required = false) List<MultipartFile> file, PhotoDomain domain,
			HttpServletRequest request) {
		// 더미데이터 넣어줘야함
//		post_id, team_id, brd_id, post_title, post_content, tmem_id, 
//   		post_tmem_level, post_nickname, post_email, post_regdate, post_update, post_hit
		
		System.out.println(file);
		
		Timestamp time = new Timestamp(1);

		domain.setPOST_ID(10);
		domain.setTeamId(8);
		domain.setBRD_ID(28);
		domain.setTMEM_ID(6);
		domain.setPostTmemLevel(1);
		domain.setPostNickname("testNickname");
		domain.setPostEmail("testEmail");
		domain.setPostRegdate(time);
		domain.setPostUpdate(time);
		domain.setHit(0);

		// files.add(m1);

		String url = service.restore(file, domain);
				
		
		model.addAttribute("url", url);
//		
		String title = request.getParameter("title");
		model.addAttribute("title", title);

		return "filelistview";//
	}

	@RequestMapping("/list2")
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

		List<PhotoDomain> boardList = service.selectBoardListPage(criteria);

		model.addAttribute("list", boardList);
		model.addAttribute("pageMaker", pageMaker);

		// return "redirect:list";
	}

	// 사진첩 목록
	@GetMapping("/groups/{groupid}/photos1")
	public String list(@PathVariable String groupid, Model model) {

		System.out.println("list()호출");

		model.addAttribute("domain", service.selectBoardList());

		return "list";
	}

	@GetMapping("/groups/{groupid}/photos2")
	public String content_view(@PathVariable String groupid, Model model, HttpServletRequest request) throws Exception {

		model.addAttribute("content_view", service.selectBoardOne(groupid));

		return "content_view";
	}

	@GetMapping("/groups/{groupid}/photos3")
	public String write_view(@PathVariable String groupid, Model model, HttpServletRequest request) throws Exception {
		System.out.println("write_view()");

		return "write_view";
	}

	@GetMapping("/groups/{groupid}/photos4")
	public String write(PhotoDomain domain, @PathVariable String groupid, Model model, HttpServletRequest request)
			throws Exception {
		System.out.println("write");
//		model.addAttribute("write_view",boardService.selectBoardOne(bId));
		service.insertBoard(domain);

		return "redirect:list";
	}

	@GetMapping("/groups/{groupid}/photos/{photoid}/edit5")
	public String delete(@PathVariable String groupid, @PathVariable String photoid, Model model,
			HttpServletRequest request, PhotoDomain domain) throws Exception {
		System.out.println("delete");
//		model.addAttribute("write_view",boardService.selectBoardOne(bId));
		int test = Integer.parseInt(photoid);

		service.photoUPBoard(domain);
		service.deleteBoard(domain);

//		딜리티 메서드 팀 포스트 
//		딜리트 어태치 총 3개만들어서 각각 삭제되게 해야함 맵퍼와 서비스도 3개 선언 구현해야함

		return "redirect:list";
	}

	// 게시물 수정 사진 및 파일도 가치 수정
	@GetMapping("/groups/{groupid}/photos/{photoid}/edit6")
	public String modify(PhotoDomain domain, @PathVariable String groupid, @PathVariable String photoid, Model model) {
		System.out.println("modify");

		service.modifyBoard(domain);
		service.photoUPBoard(domain);

		return "redirect:list";
	}

	@GetMapping("/group/{groupid}/photos/{photoid}/edit7")
	public String reply_view(PhotoDomain domain, @PathVariable String groupid, @PathVariable String photoid,
			Model model, HttpServletRequest request) throws Exception {
		System.out.println("reply_view()");

		String gid = request.getParameter("groupid");
		String pid = request.getParameter("photoid");

		model.addAttribute("reply_view", service.selectBoardOne(gid));
		model.addAttribute("reply_view", service.selectBoardOne(pid));

		return "reply_view";
	}

	@GetMapping("/groups/{groupid}/photos/{photoid}/replies/new")
	public String replyBoard(PhotoDomain domain, @PathVariable String groupid, Model model,
			HttpServletRequest request) {
		System.out.println("reply()");

		service.replyUPBoard(domain);
		service.replyBoard(domain);

		return "redirect:list";
	}

	@GetMapping("/groups/{groupid}/photos/{photoid}/replies/{replyid}/delete")
	public String replydeleteBoard(PhotoDomain domain, @PathVariable String groupid, Model model,
			HttpServletRequest request) {
		System.out.println("reply()");

		service.replydeleteBoard(domain);

		return "redirect:list";
	}

	// 사진 및 파일만 딜리트
	@GetMapping("/groups/{groupid}/photos/{photoid}/replies/{replyid}/delete2")
	public String photodeleteBoard(PhotoDomain domain, @PathVariable String groupid, Model model,
			HttpServletRequest request) {
		System.out.println("reply()");

		service.photodeleteBoard(domain);
		return "redirect:list";
	}

}