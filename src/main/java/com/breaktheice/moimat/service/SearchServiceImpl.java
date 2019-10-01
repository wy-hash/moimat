package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.TeamDomain;
import com.breaktheice.moimat.persistence.SearchMapper;


@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchMapper mapper;
	//관심사 리스트
	@Override
	public List<InterestDomain> intList() {
		
		return mapper.intList();
	}
	
	//자동 완성 관심사 리스트
	@Override
	public List<TeamDomain> autocomplete(String intName) {
		
		return mapper.autocomplete(intName);
	}
	
	@Override
	public List<InterestDomain> recommend(String keyword) {

		return mapper.recommend(keyword);
	}
}
