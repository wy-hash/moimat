package com.breaktheice.moimat.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.breaktheice.moimat.domain.CertDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.service.AuthService;
import com.breaktheice.moimat.service.MailSenderService;
import com.breaktheice.moimat.service.UserService;
import com.breaktheice.moimat.util.SHA256;
import com.google.gson.Gson;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("auth")
public class AuthController {

	@Autowired
	AuthService authService; 
	
	@Autowired
	UserService userService; 
	
	@Autowired
	MailSenderService mailService;
	
	@Autowired
	SHA256 sha256;
	
	@GetMapping("/login") // 사용자에게 로그인 입력 양식을 주는 페이지
	public String login(Model model) {
		
		log.info("loginPage 호출.... "); // Stem.out.println 써버에 부담 증가 .. log로 사용
		
		return "auth/login";
	}
	
	@PostMapping("/login") // 로그인 처리... post로 받았기 때문에 PostMapping으로 처리
	public String login(Model model, MemberDomain loginVo, HttpServletRequest request, RedirectAttributes rttr) {

		log.info("loginAction 호출.... ");
		log.info("login.." + loginVo.toString());

		// 성공시 로그인 성공 페이지, 실패시 로그인 페이지로 다시 이동
		boolean result = authService.loginCheck(loginVo, request);

		if (result) { // 성공한 경우 세션성립 후 성공시 로그인 성공 페이지l
			return "redirect:/";			//
		} else { // 실패의 경우 실패시 로그인 페이지와 메시지 전송 			
			rttr.addFlashAttribute("loginErrorMsg", "아이디 또는 비밀번호를 다시 확인하세요.");
			
			return "redirect:/auth/login";
		}
	}
	
	@GetMapping("/logout") // 테스트로그아웃페이지
	public String logout(Model model) {
		
		log.info("logOut 호출.... "); 
		
		return "auth/logout";
	}
	
	@PostMapping("/logout") // 로그인 처리... post로 받았기 때문에 PostMapping으로 처리
	public String logout(HttpServletRequest request) {
		 log.info("logoutAction 호출.... "); 
		 
		 HttpSession session = request.getSession(); //세션을 가져와서 
	     session.invalidate();  //세션을 지운다
		
		return "index";
	}

	@GetMapping("/findPwd") // 테스트로그아웃페이지
	public String findPwd(Model model) {
		
		log.info("findPwd 호출.... "); 
		
		return "auth/findpwd";
	}
	
	/**
	 * email 중복체크
	 * 
	 * @param
	 * @return String
	 * @throws Exception
	 */
	
	@RequestMapping(value = "/checkEmail", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody 
	public String checkId(String memEmail, HttpServletRequest request) throws Exception {
	
		log.info("checkEmail 중복체크");
		log.info("email: " +memEmail);
		
		// 1. 이메일 중복 체크
		boolean result = authService.checkEmail(memEmail);			
		Map map = new HashMap();
		
		if(result) {	// 
		
			int code = (int)(Math.random()*1000000000);
			log.info("code :" + code);
			
			String setFrom = "breacktheicemoimat@gmail.com";
			//String setTo =email;
			String setTo ="hoding@gmail.com";
			String setSubject ="이메일 찾기 인증코드";
			String setText ="인증코드는 "+code+" 입니다.";
		
			//mailService.simpleMailSend(setFrom,setTo,setSubject,setText);
			
			HttpSession session = request.getSession(true);
			session.setAttribute("certCode", code+"");
			session.setAttribute("email", memEmail);
			session.setAttribute("cnt", "0");			// 카운트
			
			log.info("인증코드는 "+code+" 입니다.");
			
			map.put("msgCode", "1");  
			map.put("msg", "인증메일이 발송되었습니다");
			
		}else {
			
			map.put("msgCode", "0");
			map.put("msg", "가입하신 메일이 존재하지 않습니다");
		}
		
		Gson gson = new Gson();
		
		String resultJson = gson.toJson(map);	
		log.info("result to json : " +resultJson);
		
		return resultJson;	
	}
	
	@RequestMapping(value = "/checkAuthCode", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody 
	public String checkAuthCode(String certCode, HttpServletRequest request) throws Exception {
	
		log.info("checkAuthCode..");
		log.info("checkAuthCode: " +certCode);
		
		Map map = new HashMap();
		
		HttpSession session = request.getSession(false);
		String code = (String)session.getAttribute("certCode");
		String email = (String)session.getAttribute("email");
		log.info("session certCode / certEmail : "+code +"/" +email);
		
		if(code.equals(certCode)) {
			
			// 임시 비밀버호 생성
			int tmpPassword = (int)(Math.random()*1000000000);
			String tmpHashPassword = sha256.encrypt(tmpPassword+"");
			log.info("tmpPassword :" + tmpPassword);
			log.info("tmpHashPassword :" + tmpHashPassword);
			
			String setFrom = "breaktheicemoimat@gmail.com";
			String setTo = email;
			String setSubject ="임시번호 발송";
			String setText ="인증이 완료되었습니다. 임시비밀번호는 "+tmpPassword+" 입니다.";
			log.info("인증이 완료되었습니다. 임시비밀번호는 "+tmpPassword+" 입니다.");
			
			//mailService.simpleMailSend(setFrom,setTo,setSubject,setText);
			
			//(추가)회원패스워드 수정 -->
			MemberDomain member = new MemberDomain();
			member.setMemEmail(email);
			member.setMemPassword(tmpHashPassword);
			
			boolean result = userService.updateMember(member);
			
			if(result) {
				map.put("msg", "임시비밀번호를 발송하였습니다");
				map.put("msgCode", "1");
			}
			else {
				map.put("msg", "서버에 장애가 발생하였습니다. 다시 시도하세요");
				map.put("msgCode", "-1");
			}
			
		}else {
			map.put("msg", "인증번호가 맞지 않습니다");
			map.put("msgCode", "0");
		}
		
		Gson gson = new Gson();
		
		String resultJson = gson.toJson(map);	
		log.info("result to json : " +resultJson);
		
		return resultJson;	
	}
	
	////////////////////////////////////////////////////////////////
	
	/**
	 * 회원정보 페이지
	 * 
	 * @param
	 * @return String
	 * @throws Exception
	 */
	
	@GetMapping("/join")
	public String join(HttpServletRequest request) {
		 log.info("joinPage 호출.... "); 
		 
	 	return "auth/join";
	}
	
	/**
	 * 회원정보등록
	 * 
	 * @param
	 * @return String
	 * @throws Exception
	 */
	
	@PostMapping("/join")
	public String join(MemberDomain vo) throws Exception {
	
		log.info("joinAction 호출..");
		log.info("vo :" +vo);
		
		if(authService.joinMember(vo)) {
			log.info("성공");
			return "index";	// 회원가입 완료 페이지
		}
		
		log.info("실패");
		
		return "fail";	// 실패 페이지
	}
		

	/**
	 * 회원등록 페이지 - 관심사 코드 갖고오기
	 * @param
	 * @return String
	 * @throws Exception
	 */
	
	@RequestMapping(value = "/codeList", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8") // produces = "text/plain;charset=UTF-8: 한글
	@ResponseBody 				
	public String makeCodeList() throws Exception { // ajax 데이터 전송
	
		log.info("makeCodeList 호출..");
		
		Map map = new HashMap();
		
		map.put("codeList", authService.getInterestCodeList());
		Gson gson = new Gson();
		String json = gson.toJson(map);

		log.info(json);

		return json;
	}
	
	
	/**
	 * email 중복조회(회원가입시)
	 * 
	 * @param
	 * @return String
	 * @throws Exception
	 */
	
	@RequestMapping(value = "/checkEmailJoin", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody 
	public String memberCheckId(String email) throws Exception {
	
		log.info("checkEmail 호출..");
		log.info("email: " +email);
		
		// 1. 이메일 중복체크
		boolean result = authService.checkEmail(email);			// 이메일 중복여부 확인(중복이 있으면 true, 없으면 false)
		Map map = new HashMap();
		
		if(!result) {	// 중복없는 경우 (false)
			// 2. 인증코드 생성
			int code = (int)(Math.random()*1000000000);
			log.info("code :" + code);
				
			// 2-1)인증메일 발송 세팅  --> 
			String setFrom = "test@gmail.com";
			String setTo =email;
			String setSubject ="인증메일 발송안내";
			String setText ="인증번호는"+code+"입니다.";
					
			// 2-2) 인증번호 메일 발송  --> 
			//mailService.simpleMailSend(setFrom,setTo,setSubject,setText);
			
			// 3. 인증코드 테이블에 추가
			CertDomain auth = new CertDomain();
			auth.setCertCode(code+"");
			auth.setCertEmail(email);
			authService.insertCode(auth);
			
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
	
	@RequestMapping(value = "/checkAuthCodeJoin", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
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