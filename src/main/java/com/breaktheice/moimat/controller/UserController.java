package com.breaktheice.moimat.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.breaktheice.moimat.domain.CertDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.google.gson.Gson;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user")
public class UserController {

	//@Autowired
	//UserService userService;

	@GetMapping("/{id}/edit")
	public String users(Model model, HttpServletRequest request) {
		
		log.info("/users/{id}/edit..호출");
		
		HttpSession session = request.getSession(false);
		MemberDomain member = (MemberDomain)session.getAttribute("loginVO");
		if(member == null) { return "redirect:/auth/login"; }
		
		log.info("인증");
		
		return "user/use";
	}
	
	@PostMapping("/{id}/edit")
	public String template() {
		
		return "template";
	}
	
	/**
	 * 인증코드 확인
	 * 
	 * @param
	 * @return String
	 * @throws Exception
	 */
	
	@RequestMapping(value = "/selectUser", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody 
	public String checkAuthCode(CertDomain auth) throws Exception {
	
		log.info("checkAuthCode 호출..");
		log.info("checkAuthCode: " +auth.getCertCode());
		log.info("email: " +auth.getCertEmail());
		
		
		Map map = new HashMap();
		
		// 인증코드 확인  => 발송된 인증번호와 메일 인증번호 일치 여부 확인
		boolean result = authService.selectAuthCode(auth);
		
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
}
