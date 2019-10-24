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
import com.breaktheice.moimat.util.AdminCriteria;

@Service
public class TeamMemberServiceimpl implements TeamMemberService {

	@Autowired
	private TeamMemberMapper tmm;
	
	// 회원 한명의 정보를 가져올때 (회원관리 회원 클릭시 사용)
	@Override
	public TeamMemberDomain getMember(Long memberId) {
		return tmm.getMember(memberId);
	}
	// 리스트에 뿌려질 정보 셋팅
	@Override
	public TeamMemberListVO getMemberList(Long teamId, String status,AdminCriteria cri) {
		TeamMemberListVO vo = new TeamMemberListVO();
		
		vo.setTeamMemberCount(tmm.getMemberTotal(teamId, status, cri));
		vo.setGetMember(tmm.getMemberList(teamId, status, cri));
		HashMap<Integer, String> grade = new HashMap<>();
		grade.put(1, "가입대기");
		grade.put(2, "일반회원");
		grade.put(7, "운영진");
		grade.put(9, "모임장");
		vo.setGrade(grade);
		return vo;
	}
	
	// 체크박스 이용하는 것과 그냥 버튼으로 하나씩 하는걸 따로 만들기 싫어서 한명만 변경되는 경우라도 그냥 리스트에 담아서 가져옴
	@Override
	public int deletemember(List<Long> tmemIds) {
		return tmm.selectedMemberDelete(tmemIds);
	}

	@Override
	public int updatemember(GroupMemberVO groupMemberVO) {
		return tmm.memberUpdate(groupMemberVO.getTmemIds(), groupMemberVO.getTmemLevel());
	}

	@Override
	public boolean isMaster(Long teamId, Long memId) {
		return tmm.isMaster(teamId, memId);
	}

	@Override
	@Transactional
	public int updateMaster(GroupMemberVO groupMemberVO) {
		// 여기 문제가있어서 ... -1이면 서버에러뜰걸로 예상되는데 일단 이렇게해놓음
		int result = -1;
		// team table의 MEM_ID 변경.
		System.out.println("==============1==========");
		if(groupMemberVO.getTmemIds().size()==1) {
			System.out.println("==============2==========");
		for (Long tmemId : groupMemberVO.getTmemIds() ) {
			tmm.changeMaster(tmemId, groupMemberVO.getTeamId());
		}
		}else {
			
			return result;
		}
		System.out.println("==============3==========");
		if(tmm.memberUpdate(groupMemberVO.getTmemIds(), groupMemberVO.getTmemLevel())!=1) {
			return result;
			
		}
		System.out.println("==============4==========");
		List<Long> master = new ArrayList<Long>();
		master.add(tmm.getTmemId(groupMemberVO.getMemberId(), groupMemberVO.getTeamId()));
		
		System.out.println(groupMemberVO.getMemberId());
		return tmm.memberUpdate(master, 2);
	}

	@Override
	public boolean isAdmin(Long groupId, Long memberId) {
		return tmm.isAdmin(groupId, memberId);
	}

	@Override
	public TeamMemberDomain getTeamMemberId(Long groupId, Long memId) {
		return tmm.selectMemberByTeamIdAndMemId(groupId, memId);
	}
}
