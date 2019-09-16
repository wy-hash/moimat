package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.PostTypeDomain;

public interface PostTypeMapper {
	public List<PostTypeDomain> list();
	public PostTypeDomain view(PostTypeDomain domain);
	public int add(PostTypeDomain domain);
	public int update(PostTypeDomain domain);
	public int remove(PostTypeDomain domain);
}
