package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.MeetMemberVO;
import com.breaktheice.moimat.domain.MeetVO;

public interface MeetingService {
	//모임생성
	public void createMeet(MeetVO meetVO, MeetMemberVO meetMemberVO);
}
