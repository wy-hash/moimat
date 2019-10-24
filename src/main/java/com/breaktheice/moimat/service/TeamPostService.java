package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.util.AdminCriteria;

public interface TeamPostService {

    Long writePost(TeamPostDomain post);

    TeamPostDomain getPost(Long postId, Long brdId);

    void updatePost(TeamPostDomain post);

    void deletePost(Long postId);

    void updateViewCount(Long postId);

    List<TeamPostDomain> getAllPosts(Long teamId, AdminCriteria cri);
    
    public Long getTotalCount(Long teamId, AdminCriteria cri);
}
