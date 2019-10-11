package com.breaktheice.moimat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.breaktheice.moimat.domain.GroupMemberVO;
import com.breaktheice.moimat.domain.MessageVO;
import com.breaktheice.moimat.domain.TeamMemberDomain;
import com.breaktheice.moimat.domain.TeamMemberListVO;
import com.breaktheice.moimat.persistence.TeamMemberMapper;

@Service
public class TeamMemberServiceimpl implements TeamMemberService {

	@Autowired
	private TeamMemberMapper tmm;

	@Override
	public TeamMemberDomain getMember(Long memberId) {
		return tmm.getMember(memberId);
	}

	@Override
	public TeamMemberListVO getMemberList(Long teamId, String keyword) {
		TeamMemberListVO vo = new TeamMemberListVO();
		vo.setGetMember(tmm.getMemberList(teamId, keyword));
		HashMap<Integer, String> grade = new HashMap<>();
		grade.put(0, "차단회원");
		grade.put(1, "가입대기");
		grade.put(2, "일반회원");
		grade.put(3, "우수회원");
		grade.put(7, "운영진");
		grade.put(9, "모임장"); 
		vo.setGrade(grade);
		return vo;
	}

	@Override
	public int updatemember(GroupMemberVO groupMemberVO, MessageVO message) { // 뭔가 이상하지만 임시로 ...
		for (Long tmemId : groupMemberVO.getTmemIds()) {
			tmm.teamMemberNotify(message, tmemId);
		}
		return tmm.memberUpdate(groupMemberVO.getTmemIds(), groupMemberVO.getTmemLevel());
	}

	@Override
	public int deletemember(List<Long> tmemIds, MessageVO vo) {
		for (Long tmemId : tmemIds) {
			tmm.teamMemberNotify(vo, tmemId);
		}
		return tmm.selectedMemberDelete(tmemIds);
	}

	@Override
	public int updatemember(GroupMemberVO groupMemberVO) {
		MessageVO message = new MessageVO();
		if (groupMemberVO.getTmemLevel() == 0) {
			message.setSendMemId(groupMemberVO.getMemberId());
			String teamName = groupMemberVO.getTeamName();
			message.setMsgTitle(teamName + "모임에서 차단되었습니다.");
			message.setMsgContent("모임 관리자에 의하여" + teamName + " 모임에서 차단 되었습니다.");
			for (Long tmemId : groupMemberVO.getTmemIds()) {
				tmm.teamMemberNotify(message, tmemId);
			}
		} else {
			message.setSendMemId(groupMemberVO.getMemberId());
			String teamName = groupMemberVO.getTeamName();
			message.setMsgTitle(teamName + "모임에서 회원등급이 변경되었습니다.");
			message.setMsgContent("모임 관리자에 의하여" + teamName + " 모임에서 회원등급이 변경되었습니다.");
			for (Long tmemId : groupMemberVO.getTmemIds()) {
				tmm.teamMemberNotify(message, tmemId);
			}
		}
		return tmm.memberUpdate(groupMemberVO.getTmemIds(), groupMemberVO.getTmemLevel());
	}

	@Override
	public boolean isMaster(Long teamId, Long memId) {
		return tmm.isMaster(teamId, memId);
	}

	@Override
	@Transactional
	public int updateMaster(GroupMemberVO groupMemberVO) {
		MessageVO message = new MessageVO();
		message.setSendMemId(groupMemberVO.getMemberId());
		String teamName = groupMemberVO.getTeamName();
		message.setMsgTitle(teamName + "모임에서 모임장이 되셨습니다.");
		message.setMsgContent(teamName + "모임에서 모임장이 되셨습니다.");
		for (Long tmemId : groupMemberVO.getTmemIds()) {
			tmm.teamMemberNotify(message, tmemId);
			tmm.changeMaster(tmemId, groupMemberVO.getTeamId());
		}
		List<Long> master = new ArrayList<Long>();
		master.add(groupMemberVO.getMemberId());
		tmm.memberUpdate(master, 2);
		return tmm.memberUpdate(groupMemberVO.getTmemIds(), groupMemberVO.getTmemLevel());
	}

	@Override
	public boolean isAdmin(Long groupId, Long memberId) {
		return tmm.isAdmin(groupId, memberId);
	}

}
