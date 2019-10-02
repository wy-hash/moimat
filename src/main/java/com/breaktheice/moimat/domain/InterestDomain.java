package com.breaktheice.moimat.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class InterestDomain {

	//interest Table : INT_ID, INT_KEY, INT_NAME, INT_ORDER, INT_IS_USE
	
	private Long intId;
	private String intKey;
	private String intName;
	private Long intOrder;
	private String intIsUse;
	
}
