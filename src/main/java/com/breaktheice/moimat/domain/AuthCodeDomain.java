package com.breaktheice.moimat.domain;

import lombok.Data;

@Data
public class AuthCodeDomain {
	private String email;
	private String code;
	private String regTime;
	
}
