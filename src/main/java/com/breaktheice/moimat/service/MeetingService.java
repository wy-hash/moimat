package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.MeetVO;
import com.breaktheice.moimat.domain.MeetListVO;
import com.breaktheice.moimat.domain.MeetingPageVO;

public interface MeetingService {
	//정모목록
	public MeetListVO getMeetList(Long teamId,Long tmemId);
	//정모생성
	public void createMeet(MeetVO meetVO, Long memberSeq);
	//정모조회
	public MeetingPageVO readMeet(Long seq, Long memberSeq);
	//정모수정
	public void modifyMeet(MeetVO meetVO);
	//정모삭제
	public void deleteMeet(Long seq);
	//정모 참가
	public void attendMeet(Long seq, Long memberSeq);
	//정모 참석 취소
	public void cancelAttend(Long seq, Long memberSeq);
}
