package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.TeamPostDomain;

import java.util.List;

public interface TeamPostService {

    Long writePost(TeamPostDomain post);

    TeamPostDomain getPost(Long postId, Long brdId);

    void updatePost(TeamPostDomain post);

    void deletePost(Long postId);

    void updateViewCount(Long postId);

    List<TeamPostDomain> getAllPosts(Long postId, Long brdId);
}