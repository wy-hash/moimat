package com.breaktheice.moimat.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.breaktheice.moimat.domain.MeetVO;
import com.breaktheice.moimat.domain.MeetingPageVO;
import com.breaktheice.moimat.domain.MemberVO;
import com.breaktheice.moimat.persistence.MeetingMapper;

@Service
public class MeetingServiceImpl implements MeetingService{

	@Inject
	private MeetingMapper mapper;
	
	@Override
	@Transactional
	public void createMeet(MeetVO meetVO, Long memberSeq) {//정모 생성한 사람은 자동으로 해당 정모 참가 
		mapper.regMeet(meetVO);
		mapper.attendMeet(meetVO.getSeq(),memberSeq);
	}

	@Override
	@Transactional
	public MeetingPageVO readMeet(Long seq, Long memberSeq) {
		MeetVO meetVO = mapper.getMeet(seq);
		List<MemberVO> memberList = mapper.getMeetingMember(seq);
		boolean isAttend = mapper.isAttend(seq,memberSeq);
		MeetingPageVO meetingPageVO = new MeetingPageVO(meetVO, memberList, isAttend);
		return meetingPageVO;
	}

	@Override
	public void modifyMeet(MeetVO meetVO) {
		mapper.modifyMeet(meetVO);
	}

	@Override
	public void deleteMeet(Long seq) {
		mapper.deleteMeet(seq);
	}

	@Override
	public void attendMeet(Long seq, Long memberSeq) {
		mapper.attendMeet(seq, memberSeq);
	}

	@Override
	public void cancelAttend(Long seq, Long memberSeq) {
		mapper.cancelAttend(seq, memberSeq);
	}

	@Override
	public List<MeetVO> getMeetList(Long teamSeq) {
		// TODO Auto-generated method stub
		return mapper.getMeetList(teamSeq);
	}

	
}
