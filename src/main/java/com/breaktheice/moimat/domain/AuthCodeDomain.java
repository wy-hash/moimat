package com.breaktheice.moimat.domain;

import lombok.Data;

@Data
public class AuthCodeDomain {
	private String certId;
	private String cretCode;
	private String cretEmail;
	private String cretRegdate;
	
}
