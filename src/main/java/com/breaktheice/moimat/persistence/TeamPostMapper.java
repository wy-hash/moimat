package com.breaktheice.moimat.persistence;

import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.domain.TeamPostFileDomain;
import com.breaktheice.moimat.util.AdminCriteria;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeamPostMapper {

    TeamPostDomain selectPost(@Param("postId") Long postId, @Param("brdId") Long brdId);
    //23일반 22그냥 !
    List<TeamPostDomain> selectAllPosts(@Param("teamId") Long teamId, @Param("cri") AdminCriteria cri);

    Long insertPost(TeamPostDomain post);

    void updatePost(TeamPostDomain post);

    void deletePost(Long postId);

    void updateViewCount(Long postId);

}
