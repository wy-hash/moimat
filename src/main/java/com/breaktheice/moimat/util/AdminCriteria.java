package com.breaktheice.moimat.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class AdminCriteria {
	private Long brdId;//게시판 타입
	
	private Long pageNum;
	private Long amount;
	
	private String type;
	private String keyword;
	
	
	public AdminCriteria() {
		this(1L, 10L);
	}
	
	public AdminCriteria(Long pageNum, Long amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		// 검색조건을 배열로 받아서  메서드를 활용하여 MyBatis의 동적 태그를 사용하기 위함 
		return type == null? new String[] {}: type.split("");//검색조건은 한글자씩 자르기위함
	}
}
