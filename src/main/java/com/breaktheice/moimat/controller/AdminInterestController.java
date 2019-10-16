package com.breaktheice.moimat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.service.AdminInterestService;
import com.breaktheice.moimat.util.AdminCriteria;
import com.breaktheice.moimat.util.AdminPageDTO;

@Controller
@RequestMapping("/admin/interest")
public class AdminInterestController {
	
	@Autowired
	private AdminInterestService service; 
	
	//관심사 목록출력 
	@RequestMapping(value = {"", "list"})
	public String list(Model model, AdminCriteria cri) throws Exception{
		System.out.println("list()");
		
		List<InterestDomain> list = service.list(cri);
		Long totalCount = service.totalCount(cri);

		model.addAttribute("pageMaker", new AdminPageDTO(cri, totalCount));//페이지네이션
		model.addAttribute("list", list);
		
		return "/admin/interest/list";
	}
	
	//관심사 등록
	@RequestMapping(value="new", method = RequestMethod.GET)
	public String add() throws Exception{
		System.out.println("add GET()");
		
		return "/admin/interest/write";
	}
	
	//관심사 등록
	@RequestMapping(value="new", method = RequestMethod.POST)
	public String add(Model model, InterestDomain domain) throws Exception{
		System.out.println("add POST()");
		System.out.println(domain);
		//관심사 등록 성공시 1 이상 반환
		Long result = service.add(domain);
		
		return "redirect:/admin/interest";
	}
	
	//관심사 상세
	@RequestMapping("view/{intId}")
	public String view(Model model, InterestDomain domain) throws Exception{
//		System.out.println(domain.getIntId());
		
		//관심사 상세
		InterestDomain result = service.view(domain);

		model.addAttribute("view", result);
		
		return "/admin/interest/view";
	}
	//관심사 수정
	@RequestMapping(value="edit/{intId}", method = RequestMethod.GET)
	public String update(Model model, InterestDomain domain) throws Exception{
		//관심사 수정
		InterestDomain result = service.view(domain);

		model.addAttribute("view", result);
		
		return "/admin/interest/update";
	}
	
	//관심사 수정
	@RequestMapping(value="edit", method = RequestMethod.POST)
	public String updateQuery(Model model, InterestDomain domain) throws Exception{
		
		System.out.println(domain);
		
		//관심사 수정성공시 1이상반환
		Long result = service.update(domain);
		
		return "redirect:/admin/interest";
	}
	
	
	//관심사 삭제
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String remove(Model model, InterestDomain domain) throws Exception{
		
		System.out.println(domain);
		
		//관심사 삭제성공시 1이상반환
		Long result = service.remove(domain);
		
		return "redirect:/admin/interest";
	}
	
	//관심사 코드 중복체크  -> true : 중복 값 없음 / false : 중복 값 있음
	@RequestMapping(value="keyCheck",method=RequestMethod.POST )
	@ResponseBody
	public String keyCheck(InterestDomain domain) throws Exception{
		
		return service.keyCheck(domain)+"";
	}
	
	
}
