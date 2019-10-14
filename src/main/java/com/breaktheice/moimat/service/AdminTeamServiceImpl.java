package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.TeamDomain;
import com.breaktheice.moimat.persistence.TeamMapper;
import com.breaktheice.moimat.util.AdminCriteria;

@Service
public class AdminTeamServiceImpl implements AdminTeamService {

	@Autowired
	private TeamMapper mapper;
	
	//for indexpage
	@Override
	public List<TeamDomain> getRandomList() {
		// TODO Auto-generated method stub
		return mapper.getRandomList();
	}

	@Override
	public Long totalCount(AdminCriteria cri) {
		return mapper.totalCount(cri);
	}

	@Override
	public List<TeamDomain> list(AdminCriteria cri) {
		// 모임 목록
		return getInfo(mapper.list(cri));
	}

	@Override
	public TeamDomain view(TeamDomain domain) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long add(TeamDomain domain) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long update(TeamDomain domain) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long remove(TeamDomain domain) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public InterestDomain getInterest(TeamDomain domain) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AreaDomain getArea(TeamDomain domain) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDomain getNickname(TeamDomain domain) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<TeamDomain> getInfo(List<TeamDomain> list) {
		for(TeamDomain domain : list){
			domain.setIntName(mapper.getInterest(domain));
			domain.setMemNickName(mapper.getNickname(domain));
			domain.setAreaRegionName(mapper.getArea(domain));
		}
        return list;
	  }

}
