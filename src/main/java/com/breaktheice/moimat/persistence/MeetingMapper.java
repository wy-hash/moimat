package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.MeetVO;
import com.breaktheice.moimat.domain.MemberVO;

public interface MeetingMapper {
	//모임 참석자 명단
	public List<MemberVO> getMeetingMember(Long seq);
	//MeetVO의 Long seq;
	public MeetVO getMeet(Long seq);
	//모임 등록
	public void regMeet(MeetVO meetVO);
}
