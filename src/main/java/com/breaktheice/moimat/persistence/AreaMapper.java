package com.breaktheice.moimat.persistence;

import com.breaktheice.moimat.domain.AreaDomain;

public interface AreaMapper {

	public AreaDomain selectMyArea(Long areaId);
}
