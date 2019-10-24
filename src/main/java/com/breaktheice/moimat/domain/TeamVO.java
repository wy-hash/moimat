package com.breaktheice.moimat.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TeamVO {
	private Long teamId;
	private Long intId;
	private String teamName;
	private String teamShortContent;
	private String teamContent;
	private Long areaId;
	private Date teamRegDate;
	private Long teamMax;
	private Long memId;
	private String teamPhoto;
}
