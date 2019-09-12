package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.MeetVO;
import com.breaktheice.moimat.domain.MemberVO;

public interface MeetingMapper {
	//모임 참석자 명단
	public List<MemberVO> getMeetingMember(Long seq);
	//모임 조회 MeetVO의 Long seq;
	public MeetVO getMeet(Long seq);
	//모임 등록(register meeting)
	public void regMeet(MeetVO meetVO);
	//모임 내용 수정
	public void modifyMeet(MeetVO meetVO);
	//모임 삭제
	public void deleteMeet(Long seq);
	//임시용
	public void deleteMeetMember(Long seq);
}
