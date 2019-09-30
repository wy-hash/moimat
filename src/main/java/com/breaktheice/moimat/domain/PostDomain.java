package com.breaktheice.moimat.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PostDomain {
	
// POST_ID, POST_NUM, BRD_ID, POST_TITLE, POST_CONTENT,
// MEM_ID, POST_NICKNAME, POST_EMAIL, POST_REGDATE, POST_UPDATE,
// POST_HIT, POST_REPLY, POST_ORIGIN, POST_DEPTH
	
	private Long postId;			// PK 
	private Long postNum;			// 게시물 정렬을 위함 (우선은 생략하고 시퀀스로 진행) 
	private Long brdId;				// 게시판의 PK
	private String postTitle;		// 게시물 제목
	private String postContent;		// 게시물 내용
	private Long memId;				// 게시물 작성자의 PK
	private String postNickname;	// 게시물 작성자의 닉네임
	private String postEmail;		// 게시물 작성자의 이메일
	private String postRegdate;		// 게시물의 등록일
	private String postUpdate;		// 게시물의 수정일
	private Long postHit;			// 게시물의 조회수
	private String postReply;		// 게시물의 답글 여부 (QnA 게시판용 질문글 Q 답변글 A)
	private Long postOrigin;		// 원글의 PK번호
	private Long postDepth;			// 답글 1 원글 0

}
