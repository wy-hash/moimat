package com.breaktheice.moimat.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
@RequestMapping("/mypage")
public class UserController {

   @Autowired
   UserService userService;
   
   @Autowired
   AuthService authService;
   
   @Autowired
   FileUploadService fileUploadService;
   
   @Autowired
   SHA256 sha256;
   
  
   @GetMapping(value= {"","/"}) // user/
   public String users(Model model, HttpServletRequest request) {
      
      log.info("get : /mypage/..호출");
      
      HttpSession session = request.getSession();
      MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
      
      Long memId = md.getMemId();
      model.addAttribute("UserInfoVO",userService.getUserInfoPage(memId));
       
      return "user/user";
   }
   
   @GetMapping("/usercheck")
   public String userCheck(Model model, HttpServletRequest request) {
      
      log.info("get : /mypage/..호출");
      
      HttpSession session = request.getSession();
      MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
      
      Long memId = md.getMemId();
      model.addAttribute("UserInfoVO",userService.getUserInfoPage(memId));
       
      return "user/usercheck";
   }
   
   @PostMapping("/usercheck")
   public String passwordCheck(HttpServletRequest request,MemberDomain memberDomain, RedirectAttributes rttr) {
	   HttpSession session = request.getSession();
	   MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
	   memberDomain.setMemEmail(md.getMemEmail());
	   boolean result = userService.checkPassword(memberDomain);
	   if(result) {
		   return "redirect:/mypage/edit";
	   }
	   rttr.addFlashAttribute("ErrorMsg", "비밀번호가 맞지 않습니다.");
	   return "redirect:/mypage/usercheck";
   }

   @GetMapping("/edit")
   public String userEditPage(Model model, HttpServletRequest request) {
      
      log.info("get : /users/edit..호출");
      HttpSession session = request.getSession();
      MemberDomain md = (MemberDomain) session.getAttribute("loginVO");
      Long memId = md.getMemId();
      model.addAttribute("memberDomain",userService.getMemberDomain(memId));
      model.addAttribute("areas", authService.getAllAreas());
	  model.addAttribute("interest", authService.getAllInterest());
      log.info("인증");
      
      return "user/userEdit";
   }
   
   	@PostMapping("/edit")
	public String modifyUser(MemberDomain member,HttpServletRequest request,
								  @RequestParam("areaRegionKey") String areaRegionKey,
								  @RequestParam("intKey") String intKey,
								  @RequestParam(value = "file", required = false) MultipartFile file) {
		
		log.info("member: " + member);
		log.info("area: " + areaRegionKey);
		log.info("interest: " + intKey); // eg)IA01,IA02,IA03
		System.out.println();
		HttpSession session = request.getSession();
	    MemberDomain loginVO = (MemberDomain) session.getAttribute("loginVO");
	    Long memId = loginVO.getMemId();
		member.setMemId(memId);
		System.out.println("asd"+member.getMemPassword()+"asd");
		if(member.getMemPassword().length() == 0) {
			member.setMemPassword("");
		}else {
			String plain = member.getMemPassword();
			member.setMemPassword(sha256.encrypt(plain));
		}
		member.setAreaId(authService.getAreaId(areaRegionKey));
		String[] interestKeyList = intKey.split(",");
		member.setMemInt1(authService.getInterestKey(interestKeyList[0].trim()));
		member.setMemInt2(authService.getInterestKey(interestKeyList[1].trim()));
		member.setMemInt3(authService.getInterestKey(interestKeyList[2].trim()));

		String uploadPath = "";
		
		if (0 < file.getSize()) {
			uploadPath = fileUploadService.saveFile("USER", file);
			member.setMemPhoto(uploadPath);
		}

		if(userService.updateMember(member)) {
			loginVO = userService.getMemberDomain(memId);
			loginVO.setMemPassword("");
			session.removeAttribute("loginVO");
			session.setAttribute("loginVO", loginVO);
		};

		log.info("inserted member info: " + member);

		return "redirect:/mypage";
	}
   
   @RequestMapping(value = "/photo", method = RequestMethod.POST)
   public String uploadPhoto(MultipartFile photoFile) {
      
      log.info("Post : /photo ..호출");
      // 작업순서(원리)
      // 1. 파일을 저장한다
      // 2. 저장한 파일경로를 받아서 db에 저장(member 테이블의 photo)... db에는 파일저장경로만!!!
      // ex.) upload/파일명.확장자
      // 저장은 c하위폴더에 upload폴더     
      // 파일을 저장한뒤
      if(photoFile == null)
    	  System.out.println("photoFile == null");
      
      String fileUrl = fileUploadService.restore(photoFile);
      
      // 파일경로명 찾아서 updateMember하기
      //user.setMemPhoto(fileUrl);
      
      return "edit/mypage";
   }
	/**
	 * 사진럽로드
	 * 
	 * @param
	 * @return String
	 * @throws Exception
	 */
	
	@RequestMapping(value = "/photoUpload", method = RequestMethod.POST)
	@ResponseBody 
	public String photoUpload(HttpServletRequest request, MultipartHttpServletRequest multiRequest) throws Exception {
	
		log.info("/photoUpload 호출..");
			
		HttpSession session = request.getSession(false);
		MemberDomain member = (MemberDomain)session.getAttribute("loginVO");
		
		 Map<String, MultipartFile> fileMap = multiRequest.getFileMap();

        // Maintain a list to send back the files info. to the client side
        List uploadedFiles = new ArrayList();

        // Iterate through the map
        for (MultipartFile multipartFile : fileMap.values()) {

               String fileUrl = fileUploadService.restore(multipartFile);
               
               // 파일명 저장
               member.setMemPhoto(fileUrl);	
               
               //  회원정보 수정
//               userService.updateMember(member);
        }

		
		MemberDomain user = userService.selectUserDomain(member.getMemEmail());
		
		Map map = new HashMap();
		Gson gson = new Gson();
		
		String resultJson = gson.toJson(map);	
		log.info("result to json : " +resultJson);
		
		return resultJson;	//json 형식으로 전송
	}
   
   /**
    * 1명의 회원정보 갖고오기
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
      
      return resultJson;   //json 형식으로 전송
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
      
      return resultJson;   //json 형식으로 전송
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
//      memberDomain.setMemPassword(SHA256.encrypt(memberDomain.getMemPassword()));
//      
//      boolean result = userService.updateMember(memberDomain);
      
      // 성공인 경우
//      if(result) {
//         map.put("msg", "비밀번호가 변경되었습니다");
//         map.put("msgCode", "1");
//         
//      }else {
//         map.put("msg", "에러가발생하였습니다. 다시 시도해주세요");
//         map.put("msgCode", "0");
//      }
      
      Gson gson = new Gson();
      
      String resultJson = gson.toJson(map);   
      log.info("result to json : " +resultJson);
      
      return resultJson;   //json 형식으로 전송
   }

   @GetMapping("/withdraw")
   public String withdrawPage(Model model, HttpServletRequest request) {
      
      log.info("get : /users/withdrawPage ..호출");
      
      // 인터셉터 처리해서 세션감지
      HttpSession session = request.getSession(false);
      MemberDomain member = (MemberDomain)session.getAttribute("loginVO");   
      
      return "user/withdraw";
   }
   
   @PostMapping("/withdraw")
   public String withdraw(Model model, HttpServletRequest request, RedirectAttributes reAttr) {
      
      log.info("get : /users/withdraw ..호출");
      
      HttpSession session = request.getSession(false);
      MemberDomain member = (MemberDomain)session.getAttribute("loginVO");   
      
      boolean result = userService.withdrawMember(member);
      
      if(result) {
         session.invalidate();          // 세션끊기
         return "redirect:/auth/login";
      }
      reAttr.addFlashAttribute("msg", "에러가 발생하였습니다. 다시 시도해주세요");
      
      return "redirect:/auth/login";
   }
   
   /**
    * 회원정보 갖고오기
    * 
    * @param
    * @return String
    * @throws Exception
    */
   
   @RequestMapping(value = "/getCodeList", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
   @ResponseBody 
   public String getCodeList(HttpServletRequest request) throws Exception {
   
      log.info("getCodeList 호출..");
            
      Map map = new HashMap();
      map.put("areas", authService.getAllAreas());			// 지역코드
      map.put("interest", authService.getAllInterest());	//관심사 코드
      
      Gson gson = new Gson();
      
      String resultJson = gson.toJson(map);   
      log.info("result to json : " +resultJson);
      
      return resultJson;   //json 형식으로 전송
   }
  
}
