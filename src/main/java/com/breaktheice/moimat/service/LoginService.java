package com.breaktheice.moimat.service;

import javax.servlet.http.HttpServletRequest;

import com.breaktheice.moimat.domain.LoginVO;
import com.breaktheice.moimat.domain.MemberDomain;

public interface LoginService {
	
	public boolean loginCheck(LoginVO vo, HttpServletRequest request);
	
	

}
