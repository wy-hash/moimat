package com.breaktheice.moimat.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class BoardDomain {
	// Board Table : BRD_ID, BRD_KEY, BRD_NAME, BRD_ORDER, BRD_USE

	private Long brdId;		// PK
	private String brdKey;	// 게시판 코드 
	private String brdName;	// 게시판 이름
	private Long brdOrder;	// 정렬 순서
	private String brdUse;	// 게시판 사용 유무 
	
}
