package com.breaktheice.moimat.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.CertDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.persistence.AuthMapper;
import com.breaktheice.moimat.persistence.InterestMapper;
import com.breaktheice.moimat.util.SHA256;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class AuthServiceImpl implements AuthService {

	@Autowired
	AuthMapper mapper;
	
	@Autowired
	InterestMapper interestMapper;

	@Autowired
	SHA256 sha256;

	@Override
	public boolean loginCheck(MemberDomain vo, HttpServletRequest request) { // 로그인 처리

		log.info("loginCheck");

		// 사용로자로 부터 받은 비번
		// 실제는 db에 sha256값 저장...꺼낼때도 암호문
		// 패스워드를 --- sha256값으로 암호화 ==> 꺼낸암호문과 비교했을떄 같으면 ok

		// 1. 사용자로부터 받은 패스워드를 sha256값으로 암호화
		String inputPwd = sha256.encrypt(vo.getMemPassword()); // 변환작업
		log.info("inputPassword : "+inputPwd);
		// 2. db에서 갖고옴(아직 mapper 안만듬)
		MemberDomain loginVo = mapper.login(vo);

		//log.info(loginVo);
		//log.info("db의 패스워드" + loginVo.getMemPassword());
		//log.info("사용자의 패스워드" + inputPwd);

		// 3. 비교
		if (loginVo != null && inputPwd.equals(loginVo.getMemPassword())) {

			loginVo.setMemPassword(""); // 비밀번호 제거
			HttpSession session = request.getSession(true); // 세션 객체 얻고
			session.setAttribute("loginVO", loginVo); // 세션객체에 들어갈 사옹자 정보

			log.info("로그인 성공.... ");
			log.info(loginVo);
			log.info(loginVo.getAreaDomain().toString());

			// 여기서 true반환
			return true;
		}

		// 실패의 경우 코드가 여기까기오기 때문에 반송
		log.info("로그인 실패.... ");

		return false;

	}

	/* ********************************************************************* */

	/**
	 * Interest에서 데이터 갖고오는 서비스 @param @return ArrayList @throws
	 */
	@Override
	public ArrayList getInterestCodeList() {

		log.info("getInterestCodeList()");
		log.info(mapper.getInterestCodelist());

		return mapper.getInterestCodelist();

	}

	/**
	 * 회원 정보 등록
	 * 
	 * @param MemberDomain @return Boolean @throws
	 */
	@Override
	public boolean joinMember(MemberDomain vo) {

		vo.setMemLevel(1L);
		vo.setMemStatus(1L);
		
		vo.setMemPassword(sha256.encrypt(vo.getMemPassword()));
		
		int success = mapper.join(vo); // Member테이블 삽입
		
		mapper.deleteCode(vo.getMemEmail());

		// 회원정보 등록 성공!
		if (success == 1) {

			return true;
		}

		return false;
	}

	/**
	 * email 중복조회
	 * 
	 * @param @return @throws
	 */
	@Override
	public boolean isValidEmail(String email) {

		// 디비에 메일 조건으로 뽑아옴
		String result = mapper.checkMemberEmail(email);

		// 디비에 메일 없으면
		if (result == null || result.equals("")) {
			return true; // 사용가능
		}

		return false;
	}

	/**
	 * 인증코드 저장
	 * 
	 * @param @return @throws
	 */
	@Override
	public boolean insertCode(String email) {

		CertDomain cert = new CertDomain();
		int code = (int)(Math.random()*1000000000);
		
		cert.setCertCode(code + "");
		cert.setCertEmail(email);
		
		if (mapper.insertCode(cert) == 1) {
			log.info("insertCode() is successed. cert: " + cert);
			return true;
		}
		
		return false;
	}

	/**
	 * 인증코드 확인
	 * 
	 * @param @return @throws
	 * 
	 * TODO: mapper.deleteCode() 가입 완료될때 실행되게 변경.
	 */
	
	//mapper.deleteCode()는 가입 완료버튼일때 실행하도록 바꿔야함
	public boolean selectAuthCode(CertDomain auth) {
		
		log.info(auth);
		
		CertDomain tmp = mapper.selectCode(auth);

		// 인증오케이
		if (tmp != null && tmp.getCertCode().equals(auth.getCertCode())) {

			// 기능 추가(해당 인증로우 삭제)
			//mapper.deleteCode(auth); // ** TARGET

			return true;

		}

		// 인증실패
		return false;

	}

	/**
	 * 회원정보 수정
	 * 
	 * @param @return @throws
	 */
	public boolean updateMember(MemberDomain member) {

		log.info("취미01: " + member.getMemInt1());
		log.info("취미02: " + member.getMemInt2());
		log.info("취미03: " + member.getMemInt3());
		
		int cnt = mapper.updateMember(member);
		log.info("update result: " + member);
		if (cnt == 1) {
			return true;
		}

		return false;

	}

	@Override
	public List<AreaDomain> getAllAreas() {
		// TODO Auto-generated method stub
		
		return mapper.selectAllAreas();
	}

	@Override
	public List<InterestDomain> getAllInterest() {
		// TODO Auto-generated method stub
		return mapper.selectAllInterest();
	}

	@Override
	public Long getInterestKey(String intKey) {
		// TODO Auto-generated method stub
		
		return interestMapper.selectInterestId(intKey);
	}

	@Override
	public Long getAreaId(String areaRegionKey) {
		// TODO Auto-generated method stub
		
		return mapper.selectAreaId(areaRegionKey);
	}
	
	
	
	

}
