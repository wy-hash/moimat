package com.breaktheice.moimat.domain;

import lombok.Data;

@Data
public class SearchDomain {

	private int intId; //관심사PK
	private String intName; //관심사이름
	
	private String teamName; //이름으로 찾을 팀명
	private String teamShortContent; //팀의 짧은 소개글
	
	private int areaId; //지역PK
	private String areaName; //지역이름
	private String areaRegionName; //상세지역의이름
}
