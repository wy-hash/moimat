package com.breaktheice.moimat.persistence;

import java.util.ArrayList;

import com.breaktheice.moimat.domain.MemberVO;


public interface JoinMapper {
	
	public int join(MemberVO memberVo);
	
	public int insertInterest(MemberVO memberVo);
	
	public ArrayList getInterestCodelist();
}


