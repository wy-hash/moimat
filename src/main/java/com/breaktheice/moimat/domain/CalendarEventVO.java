package com.breaktheice.moimat.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CalendarEventVO {
	private String title;
	private Date start;
	private String className;
}
