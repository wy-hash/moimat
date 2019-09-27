package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.Criteria;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.TeamDomain;
import com.breaktheice.moimat.persistence.SearchMapper;


@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchMapper mapper;
	
	//모임의 리스트
	public List<TeamDomain> list(Criteria cri) {
		
		return mapper.list(cri);
	}
	
	//(총 모임의 갯수 / 10.0)의 페이지수
	@Override
	public int totalPage(Criteria cri) {
		
		return mapper.totalPage(cri);
	}
	
	//관심사 리스트
	@Override
	public List<InterestDomain> intList() {
		
		return mapper.intList();
	}
	
	//5개의 추천 관심사 
	@Override
	public List<InterestDomain> recommend() {
		 
		return mapper.recommend();
	}
	
	//5개의 추천 관심사마다 한개의 모임
	@Override
	public List<TeamDomain> recomResult() {
		
		return mapper.recomResult();
	}

	//자동 완성 관심사 리스트
	@Override
	public List<InterestDomain> autocomplete(String intName) {
		
		return mapper.autocomplete(intName);
	}
}
