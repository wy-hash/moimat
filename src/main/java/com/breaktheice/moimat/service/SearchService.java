package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.Criteria;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.TeamDomain;

public interface SearchService {
	
	public List<TeamDomain> list(Criteria cri);

	public int totalPage(Criteria cri);
	
	public List<InterestDomain> intList();
	
	public List<InterestDomain> recommend();
	
	public List<TeamDomain> recomResult();
	
	public List<InterestDomain> autocomplete(String intName);
}
