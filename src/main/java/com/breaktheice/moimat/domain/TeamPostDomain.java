package com.breaktheice.moimat.domain;

import lombok.Data;

import java.sql.Date;

@Data
public class TeamPostDomain {

    private Long postId;
    private Long teamId;
    private Long brdId;
    private String postTitle;
    private String postContent;
    private Long tmemId;
    private Long postTmemLevel;
    private String postNickname;
    private String postEmail;
    private Date postRegdate;
    private Date postUpdate;
    private Long postHit;
}
