package com.breaktheice.moimat.util;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class AdminPageDTO {
	
	private Long startPage;
	private Long endPage;
	private boolean prev, next;
	
	private Long total;
	private AdminCriteria cri;
	
	public AdminPageDTO (AdminCriteria cri, Long total) {
		
		 this.cri = cri;
		 this.total = total;
		 
		 if(total > this.cri.getAmount()) {// 게시물의 양이 페이징 양보다 많을 경우 계산 
			 this.endPage = (long)((Math.ceil(cri.getPageNum()/10.0)) * 10);
			 this.startPage = this.endPage - 9;
			 
			 Long realEnd = (long)((Math.ceil((total * 1.0) / cri.getAmount())));
			 
			 if (realEnd < this.endPage) {
				 this.endPage = realEnd;
			 }
			 
			 this.prev = this.startPage > 1L;
			 this.next = this.endPage < realEnd;
			 
		 }else {//페이징될 게시물의 양보다 총 게시물의 양이 적다면 default 값 설정 ( 총 페이지 수가 1개일 경우 )
			 
			 this.prev = false;
			 this.next = false;
			 this.startPage = 1L;
			 this.endPage = 1L;
			 this.cri.setPageNum(1L);
			 
		 }
				
	}
	
	
}
