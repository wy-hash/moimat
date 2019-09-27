package com.breaktheice.moimat.persistence;

import java.util.Map;

import com.breaktheice.moimat.domain.LoginDomain;

public interface LoginMapper {
	
	public LoginDomain login(LoginDomain loginVO);
	
	public Map login2(LoginDomain loginVO);
}
