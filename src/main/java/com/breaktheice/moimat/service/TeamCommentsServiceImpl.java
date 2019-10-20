package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.TeamCommentsDomain;
import com.breaktheice.moimat.persistence.TeamCommentsMapper;
import com.breaktheice.moimat.service.TeamCommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeamCommentsServiceImpl implements TeamCommentsService {

    @Autowired
    TeamCommentsMapper mapper;
    @Override
    public List<TeamCommentsDomain> getAllComments(Long postId) {
        return mapper.selectAllComments(postId);
    }

    @Override
    public boolean writeComment(TeamCommentsDomain comment) {
        if (mapper.insertComment(comment) == 1) {
            return true;
        }

        return false;
    }
}
