package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.TeamCommentsDTO;
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
    public List<TeamCommentsDTO> getAllComments(Long postId) {
        return mapper.selectAllComments(postId);
    }

    @Override
    public Long writeComment(TeamCommentsDomain comment) {
        if (mapper.insertComment(comment) == 1) {
            return comment.getCmtId();
        }

        return 0L;
    }

    @Override
    public TeamCommentsDomain getCommentById(Long cmtId) {
        return mapper.selectCommentById(cmtId);
    }
}
