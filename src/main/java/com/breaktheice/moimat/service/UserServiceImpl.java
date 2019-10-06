package com.breaktheice.moimat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.persistence.UserMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper mapper;
	

	@Override
	public MemberDomain selectUserDomain(String memEmail) {
		
		return mapper.selectMember(memEmail);
	}
	
	
}
