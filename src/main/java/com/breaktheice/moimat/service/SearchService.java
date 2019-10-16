package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.Criteria;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.SearchVO;

public interface SearchService {
	
	public List<String> autocompleteInte(Criteria cri);
	
	public List<String> autocompleteArea(Criteria cri);
	
	public List<SearchVO> recommend(Criteria cri);
	
	public List<InterestDomain> list();
}
