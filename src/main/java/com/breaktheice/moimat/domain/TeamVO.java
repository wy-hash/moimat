package com.breaktheice.moimat.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TeamVO {
	private Long seq;
	private int interest_seq;
	private String name;
	private String content;
	private String short_content;
	private Date regDate;
	private String area;
	private String maxPerson;
}
