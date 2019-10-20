package com.breaktheice.moimat.domain;

import lombok.Data;

import java.sql.Date;

@Data
public class TeamCommentsDTO {
    private Long cmtId;
    private Long postId;
    private Long brdId;
    private String cmtContent;
    private Long tmemId;
    private String cmtNickname;
    private String cmtEmail;
    private Date cmtRegdate;
    private Date cmtUpdate;

    private String memPhoto;
}
