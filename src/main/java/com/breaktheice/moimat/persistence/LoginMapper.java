package com.breaktheice.moimat.persistence;

import com.breaktheice.moimat.domain.LoginVO;
import com.breaktheice.moimat.domain.MemberDomain;

public interface LoginMapper {
	
	public MemberDomain login(LoginVO loginVO);

}
