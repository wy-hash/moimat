package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.persistence.TeamPostMapper;
import com.breaktheice.moimat.util.AdminCriteria;

@Service
public class TeamPostServiceImpl implements TeamPostService {

    @Autowired
    TeamPostMapper mapper;

    @Override
    public Long writePost(TeamPostDomain post) {
        if (mapper.insertPost(post) == 1) {
            return post.getPostId();
        }
        return 0L;
    }

    @Override
    public TeamPostDomain getPost(Long postId, Long brdId) {
        return mapper.selectPost(postId, brdId);
    }

    @Override
    public void updatePost(TeamPostDomain post) {
        mapper.updatePost(post);
    }

    @Override
    public void deletePost(Long postId) {
        mapper.deletePost(postId);
    }

    @Override
    public void updateViewCount(Long postId) {
        mapper.updateViewCount(postId);
    }

    @Override
    //수정 해야 합니다!!
    public List<TeamPostDomain> getAllPosts(Long postId, AdminCriteria cri) {
        return mapper.selectAllPosts(postId, cri);
    }

	@Override
	public Long getTotalCount(Long teamId, AdminCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(teamId,cri);
	}
    
    
    
}
