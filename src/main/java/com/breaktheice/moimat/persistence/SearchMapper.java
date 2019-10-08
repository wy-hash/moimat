package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.Criteria;
import com.breaktheice.moimat.domain.SearchDomain;

public interface SearchMapper {
	
	public List<SearchDomain> autocomplete(Criteria cri);
	
	public List<SearchDomain> autocomplete2(Criteria cri);
	
	public List<SearchDomain> recommend(Criteria cri);
}
