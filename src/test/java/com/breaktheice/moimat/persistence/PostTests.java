package com.breaktheice.moimat.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.MemberVO;
import com.breaktheice.moimat.domain.PostDomain;
import com.breaktheice.moimat.domain.PostTypeDomain;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PostTests {

	@Autowired
	private PostMapper mapper;
	
	@Test
	public void listTest() {
		log.info("시작 : listTest");
		
		PostDomain domain = new PostDomain();
		domain.setPostTypeSeq(1); // 1 : 공지사항

		try {
			log.info("성공 : " + mapper.list(domain));
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}
	@Test
	public void viewTest() {
		log.info("시작 : viewTest");
		
		PostDomain domain = new PostDomain();
		domain.setPostTypeSeq(1); // 1 : 공지사항
		domain.setSeq(42); // 12 : 글 번호

		try {
			log.info("성공 : " + mapper.view(domain));
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}
	
	@Test
	public void addTest() {
		log.info("시작 : addTest");
		
		//seq, post_type_seq, title, content, regdate, updatedate,
		//count, member_seq, orgin, priority, depth, name(member와 조인해서 이름)
		
		PostDomain domain = new PostDomain(-1,-1,"공지: 오늘 점심은..", "생선구이 입니다.", "", "", 
				0, 1, 0, 0, 0, "");
		domain.setPostTypeSeq(1); // 1 : 공지사항
		
		// seq는 Seq값으로 자동증가되서 들어감.
		// regdate, updatedate는 sysdate로 입력
		// count 조회수 초기 : 0
		// member_seq 글 작성한 회원 번호
		// orgin 원글
		// priority 답글의 우선순위
		// depth 답글의 답글인경우.증가.. 미사용예정		
		
		try {
			log.info("성공 : "+ mapper.add(domain));
			
		} catch(Exception e) {
			log.error(e.getMessage());
		}
	}
	
	@Test
	public void updateTest() {
		log.info("시작 : updateTest");
		PostDomain domain = new PostDomain();
		domain.setSeq(42); // 글 번호
		domain.setPostTypeSeq(1); // 1 : 공지사항
		domain.setTitle("공지222 제목 수정합니다");
		domain.setContent("공지22 내용 수정합니다");
		//현재 사용자 정보는 Session 에서 가져온다 생각한다.
		int seq = 1; //
		try {
			
			if(seq  == mapper.memberCheck(domain)) {
				log.info("글 작성자 입니다");
				//글 작성자라면 수정
				log.info(mapper.update(domain));
				
			} else {
				log.info("글 작성자가 아닙니다.");
			}
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}
	
	@Test
	public void removeTest() {
		log.info("시작 : removeTest");
		PostDomain domain = new PostDomain();
		domain.setSeq(42); // 글 번호
		//현재 사용자 정보는 Session 에서 가져온다 생각한다.
		int seq = 1; //
		try {
			
			if(seq  == mapper.memberCheck(domain)) {
				log.info("글 작성자 입니다");
				//글 작성자라면 삭제
				log.info(mapper.remove(domain));
				
			} else {
				log.info("글 작성자가 아닙니다.");
			}
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	}

}
