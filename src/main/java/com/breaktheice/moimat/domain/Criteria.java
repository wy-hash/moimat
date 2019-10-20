package com.breaktheice.moimat.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private String type;
	private String keyword;

	public String[] getTypeArr() {

		return type == null ? new String[] {} : type.split("");
	}
}
