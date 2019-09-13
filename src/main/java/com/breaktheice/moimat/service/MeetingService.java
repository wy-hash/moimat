package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.MeetVO;
import com.breaktheice.moimat.domain.MeetingPageVO;

public interface MeetingService {
	//모임생성
	public void createMeet(MeetVO meetVO, Long memberSeq);
	
	public MeetingPageVO readMeet(Long seq, Long memberSeq);
	
	public void modifyMeet(MeetVO meetVO);
}
