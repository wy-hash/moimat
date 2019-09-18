package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.PostTypeDomain;
import com.breaktheice.moimat.persistence.PostTypeMapper;

@Service
public class PostTypeServiceImpl implements PostTypeService {
	
	@Autowired
	private PostTypeMapper mapper;
	
	@Override
	public List<PostTypeDomain> list() {
		
		return mapper.list();
	}

	@Override
	public PostTypeDomain view(PostTypeDomain domain) {
		return mapper.view(domain);
	}

	@Override
	public int add(PostTypeDomain domain) {
		return mapper.add(domain);
	}

	@Override
	public int update(PostTypeDomain domain) {
		return mapper.update(domain);
	}

	@Override
	public int remove(PostTypeDomain domain) {
		return mapper.remove(domain);
	}

}
