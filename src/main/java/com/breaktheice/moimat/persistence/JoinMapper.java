package com.breaktheice.moimat.persistence;

import java.util.ArrayList;

import com.breaktheice.moimat.domain.CertDomain;
import com.breaktheice.moimat.domain.MemberDomain;


public interface JoinMapper {
	
	public int join(MemberDomain memberVo);
	
	public ArrayList getInterestCodelist();
	
	public String checkMemberEmail(String email);
	
	public int insertCode(CertDomain auth);
	
	public CertDomain selectCode(CertDomain auth);
	
	public int deleteCode(CertDomain auth);
	
	public int updateMember(MemberDomain member);
	
}


