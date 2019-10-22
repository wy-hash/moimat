package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.TeamDomain;
import com.breaktheice.moimat.persistence.TeamMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class TeamServiceImpl implements TeamService {

	@Autowired
	private TeamMapper mapper;
	
	//for indexpage
	@Override
	public List<TeamDomain> getRandomList() {
		// TODO Auto-generated method stub
		return mapper.getRandomList();
	}

	@Override
	public List<TeamDomain> getJoinedGroupList(MemberDomain member) {
		// TODO Auto-generated method stub
		
		List<TeamDomain> td = mapper.selectJoinedGroupList(member.getMemId());
		
		log.info(td);
		
		return td;
	}

	@Override
	public TeamDomain getGroupInfo(Long groupId) {

		return mapper.selectTeamInfo(groupId);
	}




}
