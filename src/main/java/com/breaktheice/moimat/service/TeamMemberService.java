package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.*;
import com.breaktheice.moimat.util.AdminCriteria;

public interface TeamMemberService {
	
	public TeamMemberDomain getMember(Long memberId);
	
	public TeamMemberListVO getMemberList(Long teamId,String status,AdminCriteria cri);
	
	public int updatemember(GroupMemberVO groupMemberVO);
	
	public int updateMaster(GroupMemberVO groupMemberVO);
	
	public int deletemember(List<Long> tmemIds);
	
	public boolean isMaster(Long teamId, Long memId);
	
	public boolean isAdmin(Long teamId, Long memId);
	
	public Long attendTeam(Long teamId, Long memId);
	
	public Long withdrawTeam(Long teamId, Long memId);
	
	public boolean isAttendTeam(Long teamId, Long memId);

	TeamMemberDomain getTeamMemberId(Long groupId, Long memId);

	Long getTmemId(Long groupId, Long memId);

	public TeamMemberDomain getTeamMemberDomainByTmemId(Long tmemId);
}
