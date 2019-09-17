package com.breaktheice.moimat.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.breaktheice.moimat.domain.PostDomain;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration //Test for Controller
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class NoticeControllerTests {
	
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void testList() throws Exception {// 공지사항 목록 출력 테스트
		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/notice/list")
				.param("postTypeSeq", "1") // 공지사항
				).andReturn().getModelAndView().getViewName();
		
		log.info(page);
	}

	@Test
	public void testAdd() throws Exception {// 공지사항 등록 테스트
		
		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/notice/add")
				.param("postTypeSeq","1")
				.param("title", "오늘 저녁은")
				.param("content", "집밥입니다.")
				.param("count", "0")
				.param("memberSeq", "1")
				.param("priority", "0")
				.param("depth", "0")
				
				).andReturn().getModelAndView().getViewName();
		
		log.info(page);
	}
	
	@Test
	public void testView() throws Exception {// 공지사항 상세 테스트
		
		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/notice/view")
				.param("postTypeSeq", "1") // 공지사항
				.param("seq", "44")//글번호
				).andReturn().getModelAndView().getViewName();
				
		log.info(page);
	}
	
	@Test
	public void testUpdate() throws Exception {// 공지사항 수정 테스트
		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/notice/update")
				.param("postTypeSeq","1") //공지사항
				.param("title","오늘 야식은")
				.param("content","치킨입니다")
				.param("seq","44")
				).andReturn().getModelAndView().getViewName();
		log.info(page);
	}
	@Test
	public void testRemove() throws Exception {// 공지사항 수정 테스트
		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/notice/remove")
				.param("seq","44")
				).andReturn().getModelAndView().getViewName();
		log.info(page);
	}
}
