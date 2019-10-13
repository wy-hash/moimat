package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.GroupMemberVO;
import com.breaktheice.moimat.domain.MessageVO;
import com.breaktheice.moimat.domain.TeamMemberDomain;
import com.breaktheice.moimat.domain.TeamMemberListVO;

public interface TeamMemberService {
	
	public TeamMemberDomain getMember(Long memberId);
	
	public TeamMemberListVO getMemberList(Long teamId,String keyword);
	
	public int updatemember(GroupMemberVO groupMemberVO,MessageVO vo);
	
	public int updatemember(GroupMemberVO groupMemberVO);
	
	public int updateMaster(GroupMemberVO groupMemberVO);
	
	public int deletemember(List<Long> tmemIds,MessageVO vo);
	
	public boolean isMaster(Long teamId, Long memId);
	
	public boolean isAdmin(Long teamId, Long memId);
}
