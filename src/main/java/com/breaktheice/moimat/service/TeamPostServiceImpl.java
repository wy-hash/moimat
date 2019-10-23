package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.persistence.TeamPostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class TeamPostServiceImpl implements TeamPostService {

    @Autowired
    TeamPostMapper mapper;

    @Override
    public Long writePost(TeamPostDomain post) {
        if (mapper.insertPost(post) == 1) {
            return post.getPostId();
        }
        return 0L;
    }

    @Override
    public TeamPostDomain getPost(Long postId, Long brdId) {
        return mapper.selectPost(postId, brdId);
    }

    @Override
    public void updatePost(TeamPostDomain post) {
        mapper.updatePost(post);
    }

    @Override
    public void deletePost(Long postId) {
        mapper.deletePost(postId);
    }

    @Override
    public void updateViewCount(Long postId) {
        mapper.updateViewCount(postId);
    }

    @Override
    public List<TeamPostDomain> getAllPosts(Long postId, Long brdId) {
        return mapper.selectAllPosts(postId, brdId);
    }
}
