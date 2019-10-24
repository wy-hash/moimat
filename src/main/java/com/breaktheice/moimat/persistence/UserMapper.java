package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.domain.TeamVO;

public interface UserMapper {
	// session에 memid를 통해 유저정보를 가져오는 쿼리
	public MemberDomain getUserInfo(Long memId);
	
	public List<TeamPostDomain> getRecentPost(String memEmail);
	
	public String intKeyName(Long intId);
	
	public String getAreaName(Long areaId);
	
	public List<TeamVO> getRecentGroup(Long memId);
	
	public List<InterestDomain> getInterest();
	
	public List<AreaDomain> getArea();
	
	public MemberDomain selectMember(String memEmail);
	
	public int updateMember(MemberDomain member);
	
	public int updateTeamMember(MemberDomain member);
	
	public int updateMeetMember(MemberDomain member);
	
	public int deleteMember(MemberDomain member);
	
	public int updateMemStatus(MemberDomain member);
	
	public int dropMember(MemberDomain member);

	public boolean isTeamMaster(MemberDomain memberDomain);
	
}
