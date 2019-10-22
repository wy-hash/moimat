package com.breaktheice.moimat.service;

import com.breaktheice.moimat.domain.TeamCommentsDTO;
import com.breaktheice.moimat.domain.TeamCommentsDomain;
import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.persistence.TeamCommentsMapper;
import com.breaktheice.moimat.service.TeamCommentsService;

import lombok.extern.log4j.Log4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
public class TeamCommentsServiceImpl implements TeamCommentsService {

    @Autowired
    TeamCommentsMapper mapper;
    @Override
    public List<TeamCommentsDTO> getAllComments(Long postId) {
        return mapper.selectAllComments(postId);
    }

    @Override
    public Long writeComment(TeamCommentsDomain comment) {
        if (mapper.insertComment(comment) == 1) {
            return comment.getCmtId();
        }

        return 0L;
    }

    @Override
    public TeamCommentsDTO getCommentById(Long cmtId) {
        return mapper.selectCommentById(cmtId);
    }

    @Override
    public List<TeamPostDomain> addNumOfComments(List<TeamPostDomain> posts) {

        for (TeamPostDomain post: posts) {
            post.setCommentNums(mapper.selectNumsOfComments(post.getPostId()));
        }

        return posts;
    }

	@Override
	public Long modComment(TeamCommentsDomain comment) {
		
		Long result = -1L;// 결과값 : 정상등록 : 1, 실패 : -1
		log.info();
		result = mapper.modComment(comment);// 게시글 수정
		
		if(result >= 1L) {
			log.info("정상 삭제 되었습니다.");
		} else {
			log.info("삭제실패 / 에러");
		}
		
		return result;
	}
	
	@Override
	public Long deleteComment(TeamCommentsDomain comment) {
		
		Long result = -1L;// 결과값 : 정상등록 : 1, 실패 : -1

		result = mapper.deleteComment(comment);// 게시글 수정
		
		if(result >= 1L) {
			log.info("정상 삭제 되었습니다.");
		} else {
			log.info("삭제실패 / 에러");
		}
		
		return result;
	}
}
