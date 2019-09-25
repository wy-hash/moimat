package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.Criteria;
import com.breaktheice.moimat.domain.TeamDomain;

public interface SearchMapper {
	
	public List<TeamDomain> list(Criteria cri);

	public int totalPage(Criteria cri);
	
}
