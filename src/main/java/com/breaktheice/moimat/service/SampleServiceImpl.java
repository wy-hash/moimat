package com.breaktheice.moimat.service;

import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.SampleDomain;
import com.breaktheice.moimat.persistence.SampleMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class SampleServiceImpl implements SampleService {

	private SampleMapper mapper;

	@Override
	public SampleDomain getSampleDomain() {
		// TODO Auto-generated method stub
		return mapper.selectSampleDomain();
	}
	
	
}
