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

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration // Test for Controller
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
//@Log4j
public class BoardControllerTests {

	@Autowired
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void testList() throws Exception {// 게시판 목록 출력 테스트
		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/board/list")).andReturn().getModelAndView()
				.getViewName();

		System.out.println(page);
	}

	@Test
	public void testAdd() throws Exception {// 게시판 등록 테스트
		String page = mockMvc
				.perform(MockMvcRequestBuilders.post("/admin/board/new").param("brdKey", "IN31")
						.param("brdName", "게시판 테스트 중입니다.").param("brdOrder", "0").param("brdUse", "Y"))
				.andReturn().getModelAndView().getViewName();

		System.out.println(page);
	}

	@Test
	public void testView() throws Exception {// 게시판 상세 테스트

		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/board/view").param("brdId", "11")).andReturn()
				.getModelAndView().getViewName();

		System.out.println(page);
	}

	@Test
	public void testUpdate() throws Exception {// 게시판 수정 테스트
		String page = mockMvc
				.perform(MockMvcRequestBuilders.get("/admin/board/edit").param("brdId", "11").param("brdKey", "IN32")
						.param("brdName", "게시판 테스트2 중입니다.").param("brdOrder", "0").param("brdUse", "N"))
				.andReturn().getModelAndView().getViewName();
		System.out.println(page);
	}

	@Test
	public void testRemove() throws Exception {// 게시판 수정 테스트
		String page = mockMvc.perform(MockMvcRequestBuilders.get("/admin/board/delete").param("brdId", "11"))
				.andReturn().getModelAndView().getViewName();
		System.out.println(page);
	}
}
