package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.MeetMemberVO;
import com.breaktheice.moimat.domain.MeetVO;
import com.breaktheice.moimat.domain.MemberRoleVO;
import com.breaktheice.moimat.domain.MemberVO;
import com.breaktheice.moimat.domain.RoleVO;
import com.breaktheice.moimat.domain.TeamMemberVO;
import com.breaktheice.moimat.domain.TeamVO;

public interface TestMapper {
	public List<MeetMemberVO> getMeetMember();
	public List<MeetVO> getMeet();
	public List<MemberRoleVO> getMemberRole();
	public List<MemberVO> getMember();
	public List<RoleVO> getRole();
	public List<TeamMemberVO> getTeamMember();
	public List<TeamVO> getTeam();
	
}
