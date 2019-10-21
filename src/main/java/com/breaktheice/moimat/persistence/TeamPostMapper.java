package com.breaktheice.moimat.persistence;

import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.domain.TeamPostFileDomain;

public interface TeamPostMapper {

    TeamPostDomain selectPost(Long postId);

    TeamPostDomain selectAllPosts(Long teamId);

    TeamPostFileDomain selectPhoto(Long postId);
}
