package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.MemberDomain;

public interface UserService {

	MemberDomain selectUserDomain(String memEmail);//회원정보 가져오는 일을 함.
}
