package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.TeamDomain;

public interface TeamMapper {

	//for indexpage
	List<TeamDomain> getRandomList();
	
	List<TeamDomain> selectJoinedGroupList(Long memId);

	TeamDomain selectTeamInfo(Long teamId);
}
