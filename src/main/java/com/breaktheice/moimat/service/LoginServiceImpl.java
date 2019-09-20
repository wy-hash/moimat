package com.breaktheice.moimat.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.LoginDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.persistence.LoginMapper;
import com.breaktheice.moimat.util.SHA256;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class LoginServiceImpl implements LoginService {
	
	@Autowired 
	LoginMapper mapper;
	
	@Autowired
	SHA256 sha256;
		
	@Override
	public boolean loginCheck(LoginDomain vo, HttpServletRequest request) { // 로그인 처리
		
		log.info("loginCheck");
		
		// 사용로자로 부터 받은 비번
		// 실제는 db에 sha256값 저장...꺼낼때도 암호문
		// 패스워드를 --- sha256값으로 암호화 ==> 꺼낸암호문과 비교했을떄 같으면 ok
		
		// 1. 사용자로부터 받은 패스워드를 sha256값으로 암호화
		String inputPwd = sha256.encrypt(vo.getPwd()); //변환작업

		// 2. db에서 갖고옴(아직 mapper 안만듬)
		MemberDomain memberVO = mapper.login(vo);
		
		log.info("db의 패스워드" + memberVO.getPassword() + "길이:"+ memberVO.getPassword().length());
		log.info("사용자의 패스워드" + inputPwd+"길이:" + inputPwd.length());
				
		// 3. 비교
		if (memberVO != null && inputPwd.equals(memberVO.getPassword())) {
			
			HttpSession session = request.getSession(true); // 세션 객체 얻고
			session.setAttribute("memberVO", memberVO ); 	// 세션객체에 들어갈 사옹자 정보
			log.info("로그인 성공.... ");
			
			// 여기서 true반환
			return true;
		}

		// 실패의 경우 코드가 여기까기오기 때문에 반송
		log.info("로그인 실패.... ");
		
		return false;

	}

}
