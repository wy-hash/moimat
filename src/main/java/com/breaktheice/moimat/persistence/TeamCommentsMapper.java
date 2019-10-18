package com.breaktheice.moimat.persistence;

import com.breaktheice.moimat.domain.TeamCommentsDomain;

import java.util.List;

public interface TeamCommentsMapper {

    List<TeamCommentsDomain> selectAllComments(Long postId);
}
