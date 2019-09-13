package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.MeetMemberVO;
import com.breaktheice.moimat.domain.MeetVO;
import com.breaktheice.moimat.domain.MemberVO;

public interface MeetingMapper {
	//정모 목록
	public List<MeetVO> getMeetList(Long teamSeq);
	//정모 조회 MeetVO의 Long seq;
	public MeetVO getMeet(Long seq);
	//정모 등록(register meeting)
	public void regMeet(MeetVO meetVO);
	//정모 내용 수정
	public void modifyMeet(MeetVO meetVO);
	//정모 삭제
	public void deleteMeet(Long seq);
	//정모 참가(attend a meeting)
	public void attendMeet(MeetMemberVO meetMemberVO);
	//정모 참석자 명단
	public List<MemberVO> getMeetingMember(Long seq);
	//정모 참여 상태(조회시 해당 정모 참여중인가 아닌가) 생각좀 해봐야겠음
	public boolean isAttend(MeetMemberVO meeetMemberVO);
}
