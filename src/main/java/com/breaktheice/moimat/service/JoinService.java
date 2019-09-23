package com.breaktheice.moimat.service;

import java.util.ArrayList;

import com.breaktheice.moimat.domain.AuthCodeDomain;
import com.breaktheice.moimat.domain.MemberDomain;

public interface JoinService {
	
	
	/**
	 * Interest테이블에 에서 코드목록 데이터 갖고오는  서비스
	 * 
	 * @param
	 * @return ArrayList
	 * @throws
	 */
	public ArrayList getInterestCodeList();
	

	/**
	 * 회원 정보 등록
	 * 
	 * @param MemberDomain
	 * @return Boolean
	 * @throws
	 */
	public boolean joinMember(MemberDomain vo);
	
	/**
	 * email 중복조회
	 *  
	 * @param 
	 * @return 
	 * @throws
	 */
	public boolean checkEmail(String email);
	
	
	/**
	 * 인증코드 저장
	 *  
	 * @param 
	 * @return 
	 * @throws
	 */
	public boolean insertCode(AuthCodeDomain auth);
	
	/**
	 * 인증코드 확인
	 *  
	 * @param 
	 * @return 
	 * @throws
	 */
	public boolean selectAuthCode(AuthCodeDomain auth);
	

}
