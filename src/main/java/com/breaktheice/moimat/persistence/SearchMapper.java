package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.Criteria;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.SearchDomain;

public interface SearchMapper {
	
	public List<SearchDomain> autocompleteInte(Criteria cri);
	
	public List<SearchDomain> autocompleteArea(Criteria cri);
	
	public List<SearchDomain> recommend(Criteria cri);
	
	public List<InterestDomain> list();
}
