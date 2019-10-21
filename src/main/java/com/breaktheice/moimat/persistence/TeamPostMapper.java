package com.breaktheice.moimat.persistence;

import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.domain.TeamPostFileDomain;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeamPostMapper {

    TeamPostDomain selectPost(@Param("postId") Long postId, @Param("brdId") Long brdId);

    List<TeamPostDomain> selectAllPosts(@Param("teamId") Long teamId, @Param("brdId") Long brdId);

    Long insertPost(TeamPostDomain post);

    void updatePost(TeamPostDomain post);

    void deletePost(Long postId);

    void updateViewCount(Long postId);

}
