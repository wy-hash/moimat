package com.breaktheice.moimat.service;

import javax.servlet.http.HttpServletRequest;

import com.breaktheice.moimat.domain.LoginDomain;
import com.breaktheice.moimat.domain.MemberDomain;

public interface LoginService {
	
	public boolean loginCheck(LoginDomain vo, HttpServletRequest request);
	
	

}
