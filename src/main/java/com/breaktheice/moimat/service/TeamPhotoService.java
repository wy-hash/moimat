package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.domain.TeamPostFileDomain;

public interface TeamPhotoService {

    TeamPostDomain getPost(Long postId);

    TeamPostDomain getAllPosts(Long groupId);

    TeamPostFileDomain getPhoto(Long postId);


}
