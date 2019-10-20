package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.TeamPostDomain;

public interface TeamPhotoService {

    TeamPostDomain getPhoto(Long postId);

    TeamPostDomain getAllPhotos(Long groupId);
}
