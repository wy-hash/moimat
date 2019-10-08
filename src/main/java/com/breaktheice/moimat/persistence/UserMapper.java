package com.breaktheice.moimat.persistence;

import com.breaktheice.moimat.domain.MemberDomain;

public interface UserMapper {

	public MemberDomain selectMember(String memEmail);
	
	public int updateMember(MemberDomain member);
	
	public int deleteMember(MemberDomain member);
	
	public int updateMemStatus(MemberDomain member);
}
