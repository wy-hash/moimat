package com.breaktheice.moimat.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class AdminVO implements Serializable{
	

	private static final long serialVersionUID = 1L;

	// 값 , 수량
	private String value;
	private String count;
	
}
