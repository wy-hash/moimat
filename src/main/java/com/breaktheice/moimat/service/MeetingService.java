package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.MeetMemberVO;
import com.breaktheice.moimat.domain.MeetVO;
import com.breaktheice.moimat.domain.MeetingPageVO;

public interface MeetingService {
	//모임생성
	public void createMeet(MeetVO meetVO, MeetMemberVO meetMemberVO);
	
	public MeetingPageVO readMeet(Long seq, Long memberSeq);
}
