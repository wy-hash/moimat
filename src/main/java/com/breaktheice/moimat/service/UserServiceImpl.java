package com.breaktheice.moimat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.persistence.AuthMapper;
import com.breaktheice.moimat.persistence.UserMapper;
import com.breaktheice.moimat.util.SHA256;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Service
@AllArgsConstructor
@Log4j
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	AuthMapper authMapper;
	
	@Autowired
	SHA256 sha256;

	@Override
	public MemberDomain selectUserDomain(String memEmail) {
		
		return userMapper.selectMember(memEmail);
	}
	
	@Override
	public boolean checkPassword(MemberDomain memberDomain) {		// 패스워드 체크 여부 확인
		log.info(memberDomain);
		
		String password = sha256.encrypt(memberDomain.getMemPassword());
		MemberDomain member = authMapper.login(memberDomain);
		
		log.info(member);
		if(password.equals(member.getMemPassword())) {
			return true;
		}	
		
		return false;
		
	}
	
	public boolean updateMember(MemberDomain member) {

		int cnt = userMapper.updateMember(member);
		
		log.info("update result: " + member);
		if (cnt == 1) {
			return true;
		}

		return false;

	}
	
	public boolean withdrawMember(MemberDomain member) {
		
		member.setMemStatus(2L);	// 2: 탈퇴??
		
		log.info("withdrawMember: " + member);
		int cnt = userMapper.updateMemStatus(member);
		if (cnt == 1) {
			return true;
		}

		return false;
		
	}
	
	
}
