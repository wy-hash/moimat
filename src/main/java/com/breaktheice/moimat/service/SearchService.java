package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.Criteria;
import com.breaktheice.moimat.domain.SearchDomain;

public interface SearchService {
	
	public List<SearchDomain> autocomplete(Criteria cri);
	
	public List<SearchDomain> autocomplete2(Criteria cri);
	
	public List<SearchDomain> recommend(Criteria cri);
}
