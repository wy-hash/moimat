package com.breaktheice.moimat.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.breaktheice.moimat.domain.MeetMemberVO;
import com.breaktheice.moimat.domain.MeetVO;
import com.breaktheice.moimat.persistence.MeetingMapper;

@Service
public class MeetingServiceImpl implements MeetingService{

	@Inject
	private MeetingMapper mapper;
	
	@Override
	@Transactional
	public void createMeet(MeetVO meetVO, MeetMemberVO meetMemberVO) {//정모 생성한 사람은 자동으로 해당 정모 참가 
		mapper.regMeet(meetVO);
		meetMemberVO.setMeetSeq(meetVO.getSeq());
		mapper.attendMeet(meetMemberVO);
	}

	
}
