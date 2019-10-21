package com.breaktheice.moimat.persistence;

import com.breaktheice.moimat.domain.TeamCommentsDTO;
import com.breaktheice.moimat.domain.TeamCommentsDomain;

import java.util.List;

public interface TeamCommentsMapper {

    List<TeamCommentsDTO> selectAllComments(Long postId);

    Long insertComment(TeamCommentsDomain comment);

    TeamCommentsDTO selectCommentById(Long cmtId);

}
