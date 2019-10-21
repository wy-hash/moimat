package com.breaktheice.moimat.service;

import java.util.HashMap;
import java.util.List;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.TeamDomain;

public interface TeamService {

	//for indexpage
	List<TeamDomain> getRandomList();

	List<TeamDomain> getJoinedGroupList(MemberDomain member);

	TeamDomain getGroupInfo(Long groupId);

	
	// 모임 추가
	public Long add(TeamDomain domain);
	// 모임 등록시 모임장으로 추가
	public Long addGroupMaster(TeamDomain team, MemberDomain member);

	// 관심지역
	public List<AreaDomain> selectAllAreas();
	// 관심사
	public List<InterestDomain> selectAllInterest();
}
