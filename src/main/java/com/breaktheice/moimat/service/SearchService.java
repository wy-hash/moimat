package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.Criteria;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.TeamDomain;

public interface SearchService {
	
	public List<InterestDomain> intList();
	
	public List<InterestDomain> autocomplete(String keyword);
	
	public List<TeamDomain> autocomplete2(String keyword);
	
	public List<TeamDomain> recommend(Criteria cri);
}
