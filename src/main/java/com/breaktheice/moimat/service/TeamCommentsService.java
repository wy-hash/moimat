package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.TeamCommentsDTO;
import com.breaktheice.moimat.domain.TeamCommentsDomain;
import com.breaktheice.moimat.domain.TeamPostDomain;

import java.util.List;

public interface TeamCommentsService {

    List<TeamCommentsDTO> getAllComments(Long postId);

    Long writeComment(TeamCommentsDomain comment);

    TeamCommentsDTO getCommentById(Long cmtId);

    List<TeamPostDomain> addNumOfComments(List<TeamPostDomain> posts);

    Long modComment(TeamCommentsDomain comment);
    Long deleteComment(TeamCommentsDomain comment);

}
