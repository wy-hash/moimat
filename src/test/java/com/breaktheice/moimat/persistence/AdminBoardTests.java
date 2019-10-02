package com.breaktheice.moimat.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.breaktheice.moimat.domain.BoardDomain;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminBoardTests {

	@Autowired
	private BoardMapper mapper;

	@Test
	public void addTest() {
		System.out.println("시작 : addTest");

		BoardDomain domain = new BoardDomain();
//		domain.setBrdId(brdId);
//		domain.setBrdKey("IN12");
//		domain.setBrdName("관심사테스트12");
//		domain.setBrdOrder(0);
//		domain.setBrdUse("Y");
//		
		System.out.println(domain);

		try {
			System.out.println("성공 : " + mapper.add(domain));

		} catch (Exception e) {
//			log.error(e.getMessage());
		}
	}

	@Test
	public void listTest() {
		System.out.println("시작 : listTest");

		try {
			System.out.println("성공 : " + mapper.list());

		} catch (Exception e) {
//			log.error(e.getMessage());
		}
	}

	@Test
	public void view() {
		System.out.println("시작 : view");

		BoardDomain domain = new BoardDomain();

//		domain.setBrdId(2);

		try {
			System.out.println("성공 : " + mapper.view(domain));

		} catch (Exception e) {
//			log.error(e.getMessage());
		}
	}

	@Test
	public void update() {
		System.out.println("시작 : update");

		BoardDomain domain = new BoardDomain();
//		domain.setBrdId(9);
//		domain.setBrdKey("IN99");
//		domain.setBrdName("관심사 수정하였습니다12443");
//		domain.setBrdOrder(33);
//		domain.setBrdUse("N");
		try {
			System.out.println("성공 : " + mapper.update(domain));

		} catch (Exception e) {
//			log.error(e.getMessage());
		}
	}

	@Test
	public void remove() {
		System.out.println("시작 : remove");

		BoardDomain domain = new BoardDomain();
//		domain.setBrdId(9);

		try {
			System.out.println("성공 : " + mapper.remove(domain));

		} catch (Exception e) {
//			log.error(e.getMessage());
		}
	}
}
