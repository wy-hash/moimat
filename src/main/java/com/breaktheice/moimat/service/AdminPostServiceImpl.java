package com.breaktheice.moimat.service;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.persistence.PostMapper;
import com.breaktheice.moimat.util.AdminCriteria;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdminPostServiceImpl implements AdminPostService{
	
	@Autowired
	private PostMapper mapper;
	
	@Override
	public Long totalCount(AdminCriteria cri) {
		// 게시물 총 개수
		return mapper.totalCount(cri);
	}
	
	@Override
	public List<PostDomain> list(AdminCriteria cri) {

		//리스트 결과에 썸네일 추가
		List<PostDomain>  list = mapper.list(cri);
		list = Thumbnail(list);
		
		// 리스트 출력
		return list;
		
	}

	@Override
	public PostDomain view(PostDomain domain) {
		// 게시물 상세
		return mapper.view(domain);
	}
	
	@Override
	public Long viewCount(PostDomain domain) {
		// 게시물 조회수 증가
		return mapper.viewCount(domain);
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
	public Long reply(PostDomain domain) {
		
		Long result = -1L;// 결과값 : 정상등록 : 1, 실패 : -1
		
		result = mapper.reply(domain);
		
		if(result >= 1) {
			log.info("정상 등록 되었습니다.");
		} else {
			log.info("등록실패 / 에러");
		}
		
		return result;
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
	
	
	//썸네일 src 추가작업
	public List<PostDomain> Thumbnail(List<PostDomain> list) {
		
		// 썸네일 추출해서 썸네일 등록
		String content = "";
		String src = "";
		
		for(PostDomain domain : list){
		    content = domain.getPostContent() == null? "":domain.getPostContent();
		    
			//패턴작업
	        Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
	        Matcher matcher = pattern.matcher(content);
	      
	        while(matcher.find()){
	        	if(matcher.group(1) != null) {
	        		src= matcher.group(1);
	        		domain.setSrc(src);
	        		break;
	        	}
	        }
		}
        
        
        
        return list;
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
