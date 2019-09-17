package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.PostDomain;

public interface PostMapper {

	public List<PostDomain> list(PostDomain domain);
	public PostDomain view(PostDomain domain);
	public int add(PostDomain domain);
	public int update(PostDomain domain);
	public int remove(PostDomain domain);
}
