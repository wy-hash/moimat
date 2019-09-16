package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.persistence.InterestMapper;

@Service
public class InterestServiceImpl implements InterestService {
	
	@Autowired
	private InterestMapper mapper;
	
	@Override
	public List<InterestDomain> list() {
		
		return mapper.list();
	}

	@Override
	public InterestDomain view(InterestDomain domain) {
		return mapper.view(domain);
	}

	@Override
	public int add(InterestDomain domain) {
		return mapper.add(domain);
	}

	@Override
	public int update(InterestDomain domain) {
		return mapper.update(domain);
	}

	@Override
	public int remove(InterestDomain domain) {
		return mapper.remove(domain);
	}

}
