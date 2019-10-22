package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.domain.TeamPostFileDomain;

import java.util.List;

public interface TeamPhotoService {

    TeamPostDomain getPost(Long postId, Long brdId);

    List<TeamPostDomain> getAllPosts(Long groupId, Long brdId);

    List<TeamPostDomain> getThumbnail(List<TeamPostDomain> list);

}
