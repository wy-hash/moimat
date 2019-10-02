package com.breaktheice.moimat.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class CalendarEventVO {
	private String title;
	private Date start;
	private String className;
	
	
	public String getStart() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(start);
	}
	
	
}
