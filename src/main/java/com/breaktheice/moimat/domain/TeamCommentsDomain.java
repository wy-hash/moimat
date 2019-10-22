package com.breaktheice.moimat.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class TeamCommentsDomain implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long cmtId;
    private Long postId;
    private Long brdId;
    private String cmtContent;
    private Long tmemId;
    private String cmtNickname;
    private String cmtEmail;
    private String cmtRegdate;
    private String cmtUpdate;
}
