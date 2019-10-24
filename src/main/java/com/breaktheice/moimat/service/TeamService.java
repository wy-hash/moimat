package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.TeamDomain;
import com.breaktheice.moimat.domain.TeamInfoVO;

public interface TeamService {

	//for indexpage
	List<TeamDomain> getRandomList();
	List<TeamDomain> getIntRandomList(Long intId);
	List<TeamDomain> getAreaRandomList(Long areaId);

	String getInterestName(Long intId);
	String getAreaName(Long areaId);
	AreaDomain getAreaAll(Long areaId);
	

	List<TeamDomain> getJoinedGroupList(MemberDomain member);

	TeamDomain getGroupInfo(Long groupId);

	
	// 모임 추가
	public Long add(TeamDomain domain, MemberDomain member);

	// 관심지역
	public List<AreaDomain> selectAllAreas();
	// 관심사
	public List<InterestDomain> selectAllInterest();
	public TeamInfoVO settingTeamInfoVO(TeamDomain td);
}
