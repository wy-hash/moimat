package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.InterestDomain;

public interface InterestMapper {
	public List<InterestDomain> list();
	public InterestDomain view(InterestDomain domain);
	public int add(InterestDomain domain);
	public int update(InterestDomain domain);
	public int remove(InterestDomain domain);
}
