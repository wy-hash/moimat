package com.breaktheice.moimat.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.CertDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.MemberDomain;

public interface AuthService {
	
	public boolean loginCheck(MemberDomain vo, HttpServletRequest request);
	
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
	public boolean isValidEmail(String email);
	
	
	/**
	 * 인증코드 저장
	 *  
	 * @param 
	 * @return 
	 * @throws
	 */
	public boolean insertCode(String email);
	
	/**
	 * 인증코드 확인
	 *  
	 * @param 
	 * @return 
	 * @throws
	 */
	public boolean selectAuthCode(CertDomain auth);
	
	/**
	 * 회원정보 수정 
	 *  
	 * @param 
	 * @return 
	 * @throws
	 */
	public boolean updateMember(MemberDomain member);

	public List<AreaDomain> getAllAreas();

	public List<InterestDomain> getAllInterest();
	
	public Long getInterestKey(String interestKey);
	
	public Long getAreaId(String areaRegionKey);

	MemberDomain getMemberInfo(Long memId);

}
