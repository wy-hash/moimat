package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.Criteria;
import com.breaktheice.moimat.domain.TeamDomain;
import com.breaktheice.moimat.persistence.SearchMapper;

import lombok.extern.log4j.Log4j;


@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchMapper mapper;
	
	public List<TeamDomain> list(Criteria cri) {
		
		return mapper.list(cri);
	}

	@Override
	public int totalPage(Criteria cri) {
		
		return mapper.totalPage(cri);
	}
}
