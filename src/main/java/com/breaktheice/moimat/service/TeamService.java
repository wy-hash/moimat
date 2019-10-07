package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.TeamDomain;

public interface TeamService {

	//for indexpage
	List<TeamDomain> getRandomList();
}
