package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.persistence.PostMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdminNoticeServiceImpl implements AdminNoticeService{
	
	@Autowired
	private PostMapper mapper;

	@Override
	public List<PostDomain> list(PostDomain domain) {
		// 리스트 출력
		return mapper.list(domain);
	}

	@Override
	public PostDomain view(PostDomain domain) {
		// 게시물 상세
		return mapper.view(domain);
	}

	@Override
	public Long add(PostDomain domain) {
		
		Long result = -1L;// 결과값 : 정상등록 : 1, 실패 : -1
		
		result = mapper.add(domain);
		
		if(result >= 1) {
			log.info("정상 등록 되었습니다.");
		} else {
			log.info("등록실패 / 에러");
		}
		
		return result;
	}

	@Override
	public Long update(PostDomain domain) {
		
		Long result = -1L;// 결과값 : 정상등록 : 1, 실패 : -1

		result = mapper.update(domain);// 게시글 수정
		
		if(result >= 1L) {
			log.info("정상 수정 되었습니다.");
		} else {
			log.info("수정실패 / 에러");
		}
		
		return result;
	}

	@Override
	public Long remove(PostDomain domain) {
		
		Long result = -1L;// 결과값 : 정상등록 : 1, 실패 : -1

		result = mapper.remove(domain);// 게시글 수정
		
		if(result >= 1L) {
			log.info("정상 수정 되었습니다.");
		} else {
			log.info("수정실패 / 에러");
		}
		
		return result;
	}
}
