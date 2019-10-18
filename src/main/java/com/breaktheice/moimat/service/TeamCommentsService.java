package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.TeamCommentsDomain;

import java.util.List;

public interface TeamCommentsService {

    List<TeamCommentsDomain> getAllComments(Long postId);
}
