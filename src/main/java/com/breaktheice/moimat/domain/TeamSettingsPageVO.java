package com.breaktheice.moimat.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class TeamSettingsPageVO {

	TeamVO teamVO;

	AreaDomain areaDomain;

	InterestDomain interestDomain;

	// 지역
	String selectedMainArea;
	
	List<AreaDomain> areaKey;

	List<AreaDomain> areaRegionKey;
	// 관심사
	String selectedMainInt;
	
	List<InterestDomain> mainInterest;

	List<InterestDomain> subInterest;

}
