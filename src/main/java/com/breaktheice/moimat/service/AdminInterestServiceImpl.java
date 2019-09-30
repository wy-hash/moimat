package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.persistence.InterestMapper;

@Service
public class AdminInterestServiceImpl implements AdminInterestService {
	
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
	public Long add(InterestDomain domain) {
		return mapper.add(domain);
	}

	@Override
	public Long update(InterestDomain domain) {
		return mapper.update(domain);
	}

	@Override
	public Long remove(InterestDomain domain) {
		return mapper.remove(domain);
	}
	@Override
	public boolean keyCheck(InterestDomain domain) {
		
		boolean result = true;
		//중복 체크 후 결과 값 반환 중복 없으면 true 중복값 있으면 false
		
		if (mapper.keyCheck(domain) > 0L) {
			result =  false;
		}
		
		return result;
	}

}
