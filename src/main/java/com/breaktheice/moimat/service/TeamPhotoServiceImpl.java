package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.persistence.TeamPostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeamPhotoServiceImpl implements TeamPhotoService {

    @Autowired
    TeamPostMapper mapper;

    @Override
    public TeamPostDomain getPhoto(Long postId) {
        return mapper.selectPhoto(postId);
    }

    @Override
    public TeamPostDomain getAllPhotos(Long groupId) {
        return mapper.selectAllPhotos(groupId);
    }
}
