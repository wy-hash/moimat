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
	List<AreaDomain> areaKey;

	List<AreaDomain> areaRegionKey;
	// 관심사
	String selectedMainInt;
	// 구조상 대분류는 한컬럼임 대분류에서 선택된상태를 만들려면 이렇게 해야함
	List<InterestDomain> mainInterest;

	List<InterestDomain> subInterest;

}
