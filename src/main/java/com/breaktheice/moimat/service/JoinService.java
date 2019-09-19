package com.breaktheice.moimat.service;

import java.util.ArrayList;

import com.breaktheice.moimat.domain.MemberDomain;

public interface JoinService {
	
	
	/**
	 * Interest에서 데이터 갖고오는 서비스
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
	
	

}
