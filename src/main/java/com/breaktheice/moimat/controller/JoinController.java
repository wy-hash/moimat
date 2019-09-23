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

import com.breaktheice.moimat.domain.AuthCodeDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.service.JoinService;
import com.breaktheice.moimat.service.MailSenderService;
import com.google.gson.Gson;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("reg")
public class JoinController {

	@Autowired
	JoinService joinService;
	
	//@Autowired
	//MailSenderService mailService;
	
	@GetMapping("/join")
	public String join(HttpServletRequest request) {
		 log.info("joinPage 호출.... "); 
		 
	 	return "join/joinPage";
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
	 * email 중복조회
	 * 
	 * @param
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/checkEmail", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody 
	public String checkId(String email) throws Exception {
	
		log.info("checkEmail 호출..");
		log.info("email: " +email);
		
		// 1. 이메일 중복체크
		boolean result = joinService.checkEmail(email);			// 이메일 중복여부 확인(중복이 있으면 true, 없으면 false)
		Map map = new HashMap();
		
		if(!result) {	// 중복없는 경우 (false)
			// 2. 인증코드 생성
			int code = (int)(Math.random()*1000000000);
			log.info("code :" + code);
				
			// 2-1)인증메일 발송 세팅  --> 미완성
			String setFrom = "test@gmail.com";
			String setTo =email;
			String setSubject ="인증메일 발송안내";
			String setText ="인증번호는"+code+"입니다.";
					
			// 2-2) 인증번호 메일 발송  --> 미완성
		//	mailService.simpleMailSend(setFrom,setTo,setSubject,setText);
			
			// 3. 인증코드 테이블에 추가
			AuthCodeDomain auth = new AuthCodeDomain();
			auth.setCode(code+"");
			auth.setEmail(email);
			joinService.insertCode(auth);
			
			map.put("msgCode", "1");  //메세지 코드(인증번호가 발송되었습니다.)
			map.put("msg", "인증번호가 전송되었습니다");
			
		}else {
			
			map.put("msgCode", "0");
			map.put("msg", "가입된 메일이 있습니다.");
		}
		
		Gson gson = new Gson();
		
		String resultJson = gson.toJson(map);	
		log.info("result to json : " +resultJson);
		
		return resultJson;	//json 형식으로 전송
	}
	
	/**
	 * 인증코드 확인
	 * 
	 * @param
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/checkAuthCode", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody 
	public String checkAuthCode(AuthCodeDomain auth) throws Exception {
	
		log.info("checkAuthCode 호출..");
		log.info("checkAuthCode: " +auth.getCode());
		log.info("email: " +auth.getEmail());
		
		
		Map map = new HashMap();
		
		// 인증코드 확인  => 발송된 인증번호와 메일 인증번호 일치 여부 확인
		boolean result = joinService.selectAuthCode(auth);
		
		// 성공인 경우
		if(result) {
			map.put("msg", "성공");
			map.put("msgCode", "1");
			
		}else {
			map.put("msg", "실패");
			map.put("msgCode", "0");
		}
		
		Gson gson = new Gson();
		
		String resultJson = gson.toJson(map);	
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