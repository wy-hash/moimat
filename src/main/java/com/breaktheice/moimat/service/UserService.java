package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.UserInfoVO;

public interface UserService {
	
	public UserInfoVO getUserInfoPage(Long memId);
	
	public MemberDomain selectUserDomain(String memEmail);  	// 회원정보 가져오는 일을 함.
	
	public boolean checkPassword(MemberDomain memberDomain);	// 패스워드 체크 여부 확인	
	
	public boolean updateMember(MemberDomain member);			// 회원정보수정
	
	public boolean withdrawMember(MemberDomain member);			//	회원탈퇴
	
//	public boolean updateMember(MemberDomain memPhoto);			// 회원 
}
