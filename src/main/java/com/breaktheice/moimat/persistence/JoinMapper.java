package com.breaktheice.moimat.persistence;

import java.util.ArrayList;

import com.breaktheice.moimat.domain.AuthCodeDomain;
import com.breaktheice.moimat.domain.MemberDomain;


public interface JoinMapper {
	
	public int join(MemberDomain memberVo);
	
	public ArrayList getInterestCodelist();
	
	public String checkMemberEmail(String email);
	
	public int insertCode(AuthCodeDomain auth);
	
	public AuthCodeDomain selectCode(AuthCodeDomain auth);
	
	public int deleteCode(AuthCodeDomain auth);
	
	
}


