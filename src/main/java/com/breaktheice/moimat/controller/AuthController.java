package com.breaktheice.moimat.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.breaktheice.moimat.service.FileUploadService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.breaktheice.moimat.domain.CertDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.service.AuthService;
import com.breaktheice.moimat.service.MailSenderService;
import com.breaktheice.moimat.util.SHA256;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("auth")
public class AuthController {

	@Autowired
	AuthService authService; 
	
	@Autowired
	MailSenderService mailService;
	
	@Autowired
	SHA256 sha256;

	@Autowired
	ServletContext servletContext;

	@Autowired
	FileUploadService fileUploadService;
	
	@GetMapping("/login") // 사용자에게 로그인 입력 양식을 주는 페이지
	public String login(Model model) {
		
		log.info("loginPage 호출.... "); // System.out.println 써버에 부담 증가 .. log로 사용
		
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

	@DeleteMapping("/logout")
	@ResponseBody
	public String logout(HttpServletRequest req) {
		
		req.getSession().invalidate();
		
		return "{\"result\": true, \"redirectURL\": \"/\"}";
	}

	@GetMapping("/join")
	public String join2(HttpServletRequest request, Model model) {
		 log.info("joinPage 호출.... ");
		 
		 model.addAttribute("areas", authService.getAllAreas());
		 model.addAttribute("interest", authService.getAllInterest());
		 
		 
	 	return "auth/join";
	}

	@PostMapping(value = "/email-validation", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public @ResponseBody String validateEmail(@RequestParam Map<String, String> req) {
		
		String email = req.get("memEmail");	
		if (authService.isValidEmail(email)) { //등록된 이메일이 없으면

			return "{\"valid\": true}";
		}
		
		return "{\"valid\": false}";
	}
	
	@PostMapping(value = "/send-certcode", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String sendCertCode(@RequestParam String email) {
		
		if (authService.insertCode(email)) {
			return "인증코드 발송 완료\n메일함을 확인하시고 인증코드를 입력해주세요.";			
		}
		
		return "ERROR! 잠시후 다시 시도해주세요.";
	}
	
	@RequestMapping(value = "/check-certcode", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public @ResponseBody String checkCertCode(CertDomain cert) {
		
		if (authService.selectAuthCode(cert)) {
			return "{\"valid\": true}";
		}
		
		return "{\"valid\": false}";
	}
	
	@PostMapping("/join")
	@ResponseBody
	public String registerAccount(MemberDomain member,
								  @RequestParam("areaRegionKey") String areaRegionKey,
								  @RequestParam("intKey") String intKey,
								  @RequestParam(value = "file", required = false) MultipartFile file) {
		
		log.info("member: " + member);
		log.info("area: " + areaRegionKey);
		log.info("interest: " + intKey); // eg)IA01,IA02,IA03
		
		member.setAreaId(authService.getAreaId(areaRegionKey));

		String[] interestKeyList = intKey.split(",");
		member.setMemInt1(authService.getInterestKey(interestKeyList[0]));
		member.setMemInt2(authService.getInterestKey(interestKeyList[1]));
		member.setMemInt3(authService.getInterestKey(interestKeyList[2]));

		String uploadPath = "";

		if (file.getSize() <= 0) {
			String randomImage = String.valueOf((int)(Math.random() * 10) + 1) + ".png";
			uploadPath = "resources" + File.separator + "img" + File.separator + "profile-photos" + File.separator + randomImage;

		} else {
			uploadPath = fileUploadService.saveFile("USER", file);
		}

		member.setMemPhoto(uploadPath);

		authService.joinMember(member);

		log.info("inserted member info: " + member);

		return "true";
	}
}