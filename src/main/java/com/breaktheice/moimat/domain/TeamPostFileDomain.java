package com.breaktheice.moimat.domain;

import lombok.Data;

import java.sql.Date;

@Data
public class TeamPostFileDomain {

    private Long pfiId;
    private Long postId;
    private Long brdId;
    private Long tmemId;
    private Date pfiRegdate;
    private String pfiPhoto;
}
