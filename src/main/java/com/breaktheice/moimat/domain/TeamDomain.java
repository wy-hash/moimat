package com.breaktheice.moimat.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TeamDomain {

	private Long teamId;
	private int intId;
	private String teamName;
	private String teamShortContent;
	private String teamComment;
	private Long areaId;
	private Date teamRegdate;
	private Long teamMax;
	private Long memId;
}
