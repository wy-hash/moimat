package com.breaktheice.moimat.persistence;

import java.util.ArrayList;

import com.breaktheice.moimat.domain.MemberDomain;


public interface JoinMapper {
	
	public int join(MemberDomain memberVo);
	
	public int insertInterest(MemberDomain memberVo);
	
	public ArrayList getInterestCodelist();
	
	public String checkMemberId(String id);
}


