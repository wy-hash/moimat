package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.BoardDomain;
import com.breaktheice.moimat.persistence.BoardMapper;
import com.breaktheice.moimat.util.AdminCriteria;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	
	@Autowired
	private BoardMapper mapper;

	@Override
	public Long totalCount(AdminCriteria cri) {
		return mapper.totalCount(cri);
	}
	
	@Override
	public List<BoardDomain> list(AdminCriteria cri) {
		return mapper.list(cri);
	}
	@Override
	public List<BoardDomain> listAll() {
		return mapper.listAll();
	}

	@Override
	public BoardDomain view(BoardDomain domain) {
		return mapper.view(domain);
	}

	@Override
	public Long add(BoardDomain domain) {
		return mapper.add(domain);
	}

	@Override
	public Long update(BoardDomain domain) {
		return mapper.update(domain);
	}

	@Override
	public Long remove(BoardDomain domain) {
		return mapper.remove(domain);
	}

	@Override
	public boolean keyCheck(BoardDomain domain) {
		boolean result = true;
		//중복 체크 후 결과 값 반환 중복 없으면 true 중복값 있으면 false
		if (mapper.keyCheck(domain) > 0L) {
			result =  false;
		}
		
		return result;
	}
}
