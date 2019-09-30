package com.breaktheice.moimat.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.breaktheice.moimat.domain.CalendarEventVO;
import com.breaktheice.moimat.domain.MeetListVO;
import com.breaktheice.moimat.domain.MeetMemberVO;
import com.breaktheice.moimat.domain.MeetVO;
import com.breaktheice.moimat.domain.MeetingPageVO;
import com.breaktheice.moimat.persistence.MeetingMapper;

@Service
public class MeetingServiceImpl implements MeetingService{

	@Inject
	private MeetingMapper mapper;
	
	@Override
	@Transactional
	public void createMeet(MeetVO meetVO,Long groupId, Long memId) {//정모 생성한 사람은 자동으로 해당 정모 참가 
		meetVO.setTmemId(mapper.setTmemId(groupId, memId));
		meetVO.setMeetNickName(mapper.setTmemNickName(groupId, memId));
		mapper.regMeet(meetVO);
		mapper.attendMeet(meetVO.getMeetId(),groupId,memId);
	}

	@Override
	@Transactional
	public MeetingPageVO readMeet(Long meetId,Long groupId, Long memberId) {
		MeetVO meetVO = mapper.getMeet(meetId);
		List<MeetMemberVO> memberList = mapper.getMeetingMember(meetId);
		boolean isAttend = mapper.isAttend(meetId,groupId,memberId);
		MeetingPageVO meetingPageVO = new MeetingPageVO(meetVO, memberList, isAttend);
		return meetingPageVO;
	}

	@Override
	public void modifyMeet(MeetVO meetVO) {
		mapper.modifyMeet(meetVO);
	}

	@Override
	@Transactional
	public void deleteMeet(Long meetId) {
		mapper.deleteMeetMember(meetId);
		mapper.deleteMeet(meetId);
	}

	@Override
	public void attendMeet(Long meetId, Long groupId, Long memId) {
		mapper.attendMeet(meetId,groupId, memId);
	}

	@Override
	public void cancelAttend(Long meetId,Long groupId,Long memId) {
		mapper.cancelAttend(meetId,groupId,memId);
	}

	@Override
	@Transactional
	public MeetListVO getMeetList(Long teamId,Long memId) {
		List<MeetVO> list = mapper.getMeetList(teamId);
		HashMap<Long,Integer> countMeetMember = new HashMap<Long, Integer>();
		HashMap<Long,Boolean> isAttend = new HashMap<Long, Boolean>();
		HashMap<Long,Boolean> isWriter = new HashMap<Long, Boolean>();
		for (MeetVO meetVO : list) {
			Long meetId = meetVO.getMeetId();
			Long tmemId = meetVO.getTmemId();
			countMeetMember.put(meetId, mapper.countMeetMember(meetId));
			isAttend.put(meetId, mapper.isAttend(meetId,teamId,memId));
			isWriter.put(meetId, mapper.isWriter(teamId, memId, tmemId));
		}
		MeetListVO meetListVO = new MeetListVO(list,countMeetMember,isAttend,isWriter);
		return meetListVO;
	}

	@Override
	public List<CalendarEventVO> getEvent(Long groupId) {
		return mapper.getEvent(groupId);
		
	}	
}
