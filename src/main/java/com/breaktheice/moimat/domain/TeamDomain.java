package com.breaktheice.moimat.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TeamDomain {

	private Long teamId;
	private int intId;
	private String teamName;
	private String teamShortContent;
	private String teamContent;
	private String areaId;
	private Date teamRegdate;
	private int teamMax;
	private Long memId;
	
	//출력용 관심사, 활동지역, 작성자
	private String intName;
	private String areaRegionName;
	private String memNickName;
}
