package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.domain.TeamPostFileDomain;
import com.breaktheice.moimat.persistence.TeamPostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeamPhotoServiceImpl implements TeamPhotoService {

    @Autowired
    TeamPostMapper mapper;

    @Override
    public TeamPostDomain getPost(Long postId) {
        return mapper.selectPost(postId);
    }

    @Override
    public TeamPostDomain getAllPosts(Long groupId) {
        return mapper.selectAllPosts(groupId);
    }

    @Override
    public TeamPostFileDomain getPhoto(Long postId) {
        return mapper.selectPhoto(postId);
    }
}
