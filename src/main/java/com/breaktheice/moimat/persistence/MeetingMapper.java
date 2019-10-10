package com.breaktheice.moimat.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.breaktheice.moimat.domain.CalendarEventVO;
import com.breaktheice.moimat.domain.Criteria;
import com.breaktheice.moimat.domain.MeetMemberVO;
import com.breaktheice.moimat.domain.MeetVO;

public interface MeetingMapper {
	//정모 목록
	public List<MeetVO> getMeetList(Long teamId);
	//정모 목록 + 페이징
	public List<MeetVO> meetWithPaging(@Param("teamId") Long teamId,@Param("cri") Criteria cri);
	//정모 조회 MeetVO의 Long seq;
	public MeetVO getMeet(Long meetId);
	//정모 등록(register meeting)
	public void regMeet(MeetVO meetVO);
	//정모 내용 수정
	public void modifyMeet(MeetVO meetVO);
	//정모 삭제
	public void deleteMeet(Long meetId);
	//정모 참가(attend a meeting)
	public void attendMeet(@Param("meetId")Long meetId,@Param("groupId")Long groupId,@Param("memId")Long memId);
	//정모 참석 취소 (To cancel attendance(참석 취소 하기))
	public void cancelAttend(@Param("meetId")Long meetId,@Param("groupId")Long groupId,@Param("memId")Long memId);
	//정모 참석자 명단
	public List<MeetMemberVO> getMeetingMember(Long meetId);
	//정모 참여 상태(조회시 해당 정모 참여중인가 아닌가) 생각좀 해봐야겠음
	public boolean isAttend(@Param("meetId")Long meetId,@Param("groupId")Long groupId,@Param("memId")Long memId);
	//정모 참여자 수
	public int countMeetMember(@Param("meetId")Long meetId);
	
	public Long setTmemId(@Param("groupId")Long groupId,@Param("memId")Long memId);
	
	public String setTmemNickName(@Param("groupId")Long groupId,@Param("memId") Long memId);
	
	public boolean isWriter(@Param("groupId")Long groupId,@Param("memId")Long memId,@Param("tmemId")Long tmemId);
	
	public void deleteMeetMember(Long meetId);
	
	public List<CalendarEventVO> getEvent(Long groupId);
	
	public int getTotalMeet(Long teamId);
	
}
