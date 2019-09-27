package com.breaktheice.moimat.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class TeamDomain {

	private int teamId;
	private int intId;
	private String teamName;
	private String teamShortContent;
	private String teamContent;
	private String teamArea;
	private Date teamRegdate;
	private int teamMax;
	private int memId;
}
