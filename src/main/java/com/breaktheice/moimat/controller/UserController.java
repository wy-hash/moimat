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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.service.AuthService;
import com.breaktheice.moimat.service.FileUploadService;
import com.breaktheice.moimat.service.UserService;
import com.breaktheice.moimat.util.SHA256;
import com.google.gson.Gson;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/myPage")
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	AuthService authService;
	
	@Autowired
	FileUploadService fileUploadService;
	
	@GetMapping("/") // user/
	public String users(Model model, HttpServletRequest request) {
		
		log.info("get : /myPage/..호출");
		
		HttpSession session = request.getSession(false);
		
		if(session == null) { return "redirect:/auth/login"; }				// 세션이 없을시 로그인페이지
		MemberDomain member = (MemberDomain)session.getAttribute("loginVO");
		
		if(member == null) { return "redirect:/auth/login"; }
		
		log.info("인증");
		
		return "user/user";
	}

	@GetMapping("/edit")
	public String userEditPage(Model model, HttpServletRequest request) {
		
		log.info("get : /users/edit..호출");
		
		HttpSession session = request.getSession(false);
		
		if(session == null) { return "redirect:/auth/login"; }				// 세션이 없을시 로그인페이지
		MemberDomain member = (MemberDomain)session.getAttribute("loginVO");
		
		if(member == null) { return "redirect:/auth/login"; }
		
		log.info("인증");
		
		return "user/userEdit";
	}
	
	@PostMapping("/edit")
	public String userEdit(MemberDomain user, MultipartFile photoFile) {
		log.info("post : /users/edit..호출");
		
		//log.info(photoFile.getName());
		
		fileUploadService.restore(photoFile);
		
		//authService.updateMember(user);
		
		return "index";
	}
	
	/**
	 * 회원정보 갖고오기
	 * 
	 * @param
	 * @return String
	 * @throws Exception
	 */
	
	@RequestMapping(value = "/selectUser", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody 
	public String selectUser(HttpServletRequest request) throws Exception {
	
		log.info("selectUser 호출..");
			
		HttpSession session = request.getSession(false);
		MemberDomain member = (MemberDomain)session.getAttribute("loginVO");
		
		Map map = new HashMap();
		
		MemberDomain user = userService.selectUserDomain(member.getMemEmail());
				
		// 성공인 경우
		if(user != null) {
			
		}else {
			map.put("msg", "에러가 났습니다. 다시 시도해주세요");
		}
		
		map.put("user", user);
		
		Gson gson = new Gson();
		
		String resultJson = gson.toJson(map);	
		log.info("result to json : " +resultJson);
		
		return resultJson;	//json 형식으로 전송
	}
	
	/**
	 * 회원정보 수정 - 기존 비밀번호 체크
	 * 
	 * @param
	 * @return String
	 * @throws Exception
	 */
	
	@RequestMapping(value = "/checkPassword", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody 
	public String checkPassword(MemberDomain memberDomain) throws Exception {
	
		log.info("checkPassword 호출..");
			
		Map map = new HashMap();
		
		boolean result = userService.checkPassword(memberDomain);
		
		// 성공인 경우
		if(result) {
			
			map.put("msg", "비밀번호가 확인되었습니다");
			map.put("msgCode", "1");
			
		}else {
			map.put("msg", "비밀번호가 다름니다");
			map.put("msgCode", "0");
		}
		
		Gson gson = new Gson();
		
		String resultJson = gson.toJson(map);	
		log.info("result to json : " +resultJson);
		
		return resultJson;	//json 형식으로 전송
	}
	
	/**
	 * 회원정보 수정 - 비밀번호 변경
	 * 
	 * @param
	 * @return String
	 * @throws Exception
	 */
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody 
	public String cahngePassword(MemberDomain memberDomain) throws Exception {
	
		log.info("checkPassword 호출..");
			
		Map map = new HashMap();
		
		// 평문으로 들어가기때문에 비밀번호를 암호화 해줌
		memberDomain.setMemPassword(SHA256.encrypt(memberDomain.getMemPassword()));
		
		boolean result = authService.updateMember(memberDomain);
		
		// 성공인 경우
		if(result) {
			
			map.put("msg", "비밀번호가 변경되었습니다");
			map.put("msgCode", "1");
			
		}else {
			map.put("msg", "에러가발생하였습니다. 다시 시도해주세요");
			map.put("msgCode", "0");
		}
		
		Gson gson = new Gson();
		
		String resultJson = gson.toJson(map);	
		log.info("result to json : " +resultJson);
		
		return resultJson;	//json 형식으로 전송
	}

	@GetMapping("/withdraw")
	public String withdrawPage(Model model, HttpServletRequest request) {
		
		log.info("get : /users/withdrawPage ..호출");
		
		// 인터셉터 처리해서 세션감지
		HttpSession session = request.getSession(false);
		
		if(session == null) { return "redirect:/auth/login"; }					// 세션이 없을시 로그인페이지
		MemberDomain member = (MemberDomain)session.getAttribute("loginVO");	
		if(member == null) { return "redirect:/auth/login"; }
		
		
		return "user/withdraw";
	}
	
	@PostMapping("/withdraw")
	public String withdraw(Model model, HttpServletRequest request, RedirectAttributes reAttr) {
		
		log.info("get : /users/withdraw ..호출");
		
		// 인터셉터 처리해서 세션감지
		HttpSession session = request.getSession(false);
		if(session == null) { return "redirect:/auth/login"; }					// 세션이 없을시 로그인페이지
		MemberDomain member = (MemberDomain)session.getAttribute("loginVO");	
		if(member == null) { return "redirect:/auth/login"; }
		
		boolean result = userService.withdrawMember(member);
		
		if(result) {
			session.invalidate();    		// 세션끊기
			return "redirect:/auth/login";
		}
		reAttr.addFlashAttribute("msg", "에러가 발생하였습니다. 다시 시도해주세요");
		
		return "redirect:/auth/login";
	}
	
	/*@GetMapping("/photo")
	public String withdrawPage(Model model, HttpServletRequest request) {
		
		log.info("get : /photo ..호출");
		
			
		return "user/photo";
	}
	
	@PostMapping("/photo")
	public String withdraw(Model model, HttpServletRequest request, RedirectAttributes reAttr) {
		
		log.info("get : /photo ..호출");
		
		
		return "redirect:/photo";
	}*/
	
}
