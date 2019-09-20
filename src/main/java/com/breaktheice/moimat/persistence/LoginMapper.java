package com.breaktheice.moimat.persistence;

import com.breaktheice.moimat.domain.LoginDomain;
import com.breaktheice.moimat.domain.MemberDomain;

public interface LoginMapper {
	
	public MemberDomain login(LoginDomain loginVO);

}
