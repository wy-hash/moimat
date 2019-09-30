package com.breaktheice.moimat.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class InterestDomain {
	//interest Table : id, key, name, order, is use
	private int intId;
	private String intKey;
	private String intName;
	private String intOrder;
	private String intIsUse;
	
}
