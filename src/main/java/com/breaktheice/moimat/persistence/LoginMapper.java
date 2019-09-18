package com.breaktheice.moimat.persistence;

import com.breaktheice.moimat.domain.LoginVO;
import com.breaktheice.moimat.domain.MemberVO;

public interface LoginMapper {
	
	public MemberVO login(LoginVO loginVO);

}
