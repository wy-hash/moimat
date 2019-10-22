package com.breaktheice.moimat.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.util.AdminCriteria;

public interface TeamPostMapper {

    TeamPostDomain selectPost(@Param("postId") Long postId, @Param("brdId") Long brdId);
    //23일반 22그냥 !
    List<TeamPostDomain> selectAllPosts(@Param("teamId") Long teamId, @Param("cri") AdminCriteria cri);
    //pageDTO에 담을 게시글에 총 갯수 (버튼 몇개만들지에 필요) 
    public Long getTotalCount(@Param("cri") AdminCriteria cri);

    Long insertPost(TeamPostDomain post);

    void updatePost(TeamPostDomain post);

    void deletePost(Long postId);

    void updateViewCount(Long postId);

}
