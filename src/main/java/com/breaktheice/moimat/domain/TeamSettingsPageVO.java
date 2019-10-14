package com.breaktheice.moimat.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class TeamSettingsPageVO {
	
	TeamVO teamVO;
	
	AreaDomain areaDomain;
	
	InterestDomain interestDomain;
	
}
