package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.Criteria;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.SearchVO;
import com.breaktheice.moimat.persistence.SearchMapper;


@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchMapper mapper;
	
	//관심사 기반 모임 찾기
	@Override
	public List<SearchVO> recommend(Criteria cri) {
		
		return mapper.recommend(cri);
	}
	
	//자동 완성 관심사 리스트
	@Override
	public List<String> autocompleteInte(Criteria cri) {

		return mapper.autocompleteInte(cri);
	}
	
	//자동 완성 지역 리스트
	@Override
	public List<String> autocompleteArea(Criteria cri) {
		
		return mapper.autocompleteArea(cri);
	}
	
	//관심사 리스트
	@Override
	public List<InterestDomain> list() {
		
		return mapper.list();
	}

}