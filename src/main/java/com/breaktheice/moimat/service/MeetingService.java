package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.MeetVO;
import com.breaktheice.moimat.domain.MeetListVO;
import com.breaktheice.moimat.domain.MeetingPageVO;

public interface MeetingService {
	//정모목록
	public MeetListVO getMeetList(Long teamId,Long memId);
	//정모생성
	public void createMeet(MeetVO meetVO,Long groupId, Long memId);
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
}
