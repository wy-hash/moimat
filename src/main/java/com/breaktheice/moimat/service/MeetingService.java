package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.CalendarEventVO;
import com.breaktheice.moimat.domain.MeetListVO;
import com.breaktheice.moimat.domain.MeetVO;
import com.breaktheice.moimat.domain.MeetingPageVO;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.util.AdminCriteria;

public interface MeetingService {
	//정모목록
	public MeetListVO getMeetList(Long teamId,Long memId);
	//정모생성
	public void createMeet(MeetVO meetVO,MemberDomain md,Long groupId);
	//정모조회
	public MeetingPageVO readMeet(Long meetId,Long groupId, Long memberId);
	//정모수정
	public void modifyMeet(MeetVO meetVO);
	//정모삭제
	public void deleteMeet(Long meetId);
	//정모 참가
	public void attendMeet(Long meetId, Long groupId, Long memId);
	//정모 참석 취소
	public void cancelAttend(Long meetId,Long groupId,Long memId);
	//달력에 날짜 찍기
	public List<CalendarEventVO> getEvent(Long groupId);
	
	public MeetListVO meetWithPaging(Long teamId,Long memId, AdminCriteria cri);
}
