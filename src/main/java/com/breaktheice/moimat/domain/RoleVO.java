package com.breaktheice.moimat.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RoleVO {
	private Long seq;
	private String key;
	//역할 번호 1.RO001 2.RO002 3.RO003 4.RO004 5.RO005 6.RO006
	private String value;
	//역할 명
	
}
