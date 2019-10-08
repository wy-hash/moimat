package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.Criteria;
import com.breaktheice.moimat.domain.SearchDomain;
import com.breaktheice.moimat.persistence.SearchMapper;


@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchMapper mapper;
	
	//관심사 기반 모임 찾기
	@Override
	public List<SearchDomain> recommend(Criteria cri) {
		
		return mapper.recommend(cri);
	}
	
	//자동 완성 관심사 리스트
	@Override
	public List<SearchDomain> autocomplete(Criteria cri) {

		return mapper.autocomplete(cri);
	}

	@Override
	public List<SearchDomain> autocomplete2(Criteria cri) {
		
		return mapper.autocomplete2(cri);
	}
}
