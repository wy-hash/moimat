package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.TeamCommentsDTO;
import com.breaktheice.moimat.domain.TeamCommentsDomain;

import java.util.List;

public interface TeamCommentsService {

    List<TeamCommentsDTO> getAllComments(Long postId);

    Long writeComment(TeamCommentsDomain comment);

    TeamCommentsDomain getCommentById(Long cmtId);
}
