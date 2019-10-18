package com.breaktheice.moimat.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.persistence.PostMapper;
import com.breaktheice.moimat.util.AdminCriteria;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired PostMapper mapper;

	@Override
	public List<PostDomain> myqnaList(AdminCriteria cri, Long memId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("c", cri);
		map.put("memId", memId);
		System.out.println(map);
		System.out.println(mapper.myqnaList(map));
		return mapper.myqnaList(map);
	}

	@Override
	public Long myqnaTotalCount(AdminCriteria cri, Long memId) {		
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("c", cri);
		map.put("memId", memId);
		
		
		System.out.println(map);
		System.out.println(mapper.myqnaTotalCount(map));
		return mapper.myqnaTotalCount(map);
	}

}
