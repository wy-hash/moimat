package com.breaktheice.moimat.persistence;

import com.breaktheice.moimat.domain.TeamPostDomain;

public interface TeamPostMapper {

    TeamPostDomain selectPhoto(Long postId);

    TeamPostDomain selectAllPhotos(Long teamId);
}
