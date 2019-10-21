package com.breaktheice.moimat.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.persistence.PostMapper;
import com.breaktheice.moimat.util.AdminCriteria;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired PostMapper mapper;

	@Override
	public List<PostDomain> myqnaList(AdminCriteria cri, Long memId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("c", cri);
		map.put("memId", memId);
		System.out.println(map);
		System.out.println(mapper.myqnaList(map));
		return mapper.myqnaList(map);
	}

	@Override
	public Long myqnaTotalCount(AdminCriteria cri, Long memId) {		
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("c", cri);
		map.put("memId", memId);
		
		
		System.out.println(map);
		System.out.println(mapper.myqnaTotalCount(map));
		return mapper.myqnaTotalCount(map);
	}

	@Override
	public PostDomain view(PostDomain domain) {
		//  게시물 상세
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
	public Long viewCount(PostDomain domain) {
		// 게시물 조회수 증가
		return mapper.viewCount(domain);
	}

	@Override
	public Long update(PostDomain domain) {
		log.info(domain);
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

		result = mapper.remove(domain);// 게시글 삭제
		
		if(result >= 1L) {
			log.info("정상 삭제 되었습니다.");
		} else {
			log.info("삭제실패 / 에러");
		}
		
		return result;
	}

	@Override
	public boolean isReply(PostDomain domain) {

		boolean result = false;// 결과값 : 답글이 있다면 true, 없다면 false
		
		if(mapper.isReply(domain) >= 2L) {
			log.info("답변이 있는 글 입니다.");
			result = true;
		} else {
			log.info("답변이 없는 글 입니다.");
			result = false;
		}
		
		return result;
	}
}
