package com.breaktheice.moimat.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class InterestDomain {
	//interest Table : SEQ, KEY, VALUE
	private int seq;
	private String key;
	private String value;
}
