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
	private String teamArea;
	private Date teamRegdate;
	private int teamMax;
	private Long memId;
}
