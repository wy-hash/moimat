package com.breaktheice.moimat.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.AuthCodeDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.persistence.JoinMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class JoinServiceImpl implements JoinService {
	
	
	@Autowired
	JoinMapper joinMapper;
	
	/**
	 * Interest에서 데이터 갖고오는 서비스
	 * @param
	 * @return ArrayList
	 * @throws
	 */
	@Override
	public ArrayList getInterestCodeList() {
		
		log.info("getInterestCodeList()");
		
		return joinMapper.getInterestCodelist();
		
		
	}
	
	/**
	 * 회원 정보 등록
	 * 
	 * @param MemberDomain
	 * @return Boolean
	 * @throws
	 */
	@Override
	public boolean joinMember(MemberDomain vo) {
		
		int success = joinMapper.join(vo);	// Member테이블 삽입
		int success2 = joinMapper.insertInterest(vo); // MemberInterest테이블 삽입
		
		
		if(success == 1) {
			
			
			return true;
		}
		
		return false;
	}
	
	
	/**
	 * email 중복조회
	 *  
	 * @param 
	 * @return 
	 * @throws
	 */
	@Override
	public boolean checkEmail(String email) {
		
		// db에서 회원정보 갖고온다
		String result = joinMapper.checkMemberEmail(email);
		
		// email중복이 있는경우 있는경우(중복)
		if(result != null && !result.equals("")) {
			return true;
		}
		
		return false;	// 중복 없는 경우
	}
	
	/**
	 * 인증코드 저장
	 *  
	 * @param 
	 * @return 
	 * @throws
	 */
	@Override
	public boolean insertCode(AuthCodeDomain auth) {
		
		int result = joinMapper.insertCode(auth);
		
		if(result == 1) {
			return true;
		}
		
		return false;
		
	}
	
	/**
	 * 인증코드 확인
	 *  
	 * @param 
	 * @return 
	 * @throws
	 */
	public boolean selectAuthCode(AuthCodeDomain auth) {
		
		AuthCodeDomain tmp = joinMapper.selectCode(auth);
		
		// 인증오케이
		if(tmp != null && tmp.getCode().equals(auth.getCode())) {
			
			// 기능 추가(해당 인증로우 삭제)
			
			return true;
			
		}
		
		// 인증실패
		return false;
		
		
	}
	
}
