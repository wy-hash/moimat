package com.breaktheice.moimat.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.service.JoinService;
//import com.google.gson.Gson;
import com.google.gson.Gson;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("reg")
public class JoinController {

	@Autowired
	JoinService joinService;
	
	@GetMapping("/join")
	public String join(HttpServletRequest request) {
		 log.info("joinPage 호출.... "); 
		 
	 	return "login/joinPage";
	}
	
	@GetMapping("/findpwd")
	public String findpwd(HttpServletRequest request) {
		 log.info("findpwd 호출.... "); 
		 
	 	return "login/findpwd";
	}
	
	/**
	 * POST 방식으로 값을 전달
	 * 
	 * @param
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/codeList", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8") // produces = "text/plain;charset=UTF-8: 한글
	@ResponseBody // ajax 데이터 전송
	public String makeCodeList() throws Exception {
	
		log.info("makeCodeList 호출..");
		
		Map map = new HashMap();
		
		map.put("codeList", joinService.getInterestCodeList());
		Gson gson = new Gson();
		String json = gson.toJson(map);

		log.info(json);

		return json;
	}
	
	/**
	 * id 중복조회
	 * 
	 * @param
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/checkId", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody 
	public String checkId(String id) throws Exception {
	
		log.info("checkId 호출..");
		log.info("id" +id);
		
		log.info("joinService : "+ joinService);
		log.info("joinService2 : "+ joinService);
		
		Map result = joinService.checkId(id);
		Gson gson = new Gson();
		
		String resultJson = gson.toJson(result);	
		log.info("result to json : " +resultJson);
		
		return resultJson;	//json 형식으로 전송
	}
	
	
	/**
	 * 회원정보등록
	 * 
	 * @param
	 * @return String
	 * @throws Exception
	 */
	@PostMapping("/joinAction")
	public String joinAction(MemberDomain vo) throws Exception {
	
		log.info("joinAction 호출..");
		log.info("vo :" +vo);
		
		if(joinService.joinMember(vo)) {
			log.info("성공");
			return "index";	// 회원가입 완료 페이지
		}
		
		log.info("실패");
		
		return "fail";	// 실패 페이지
	}
	
	
}