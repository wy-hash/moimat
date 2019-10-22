package com.breaktheice.moimat.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.breaktheice.moimat.domain.MemberDomain;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( "file:src/main/webapp/WEB-INF/spring/root-context.xml" )
public class UserMapperTests {
	
	@Autowired
	private UserMapper um;
	
	@Test
	public void test() {
		MemberDomain member = new MemberDomain();
		member.setMemId(3L);
		member.setMemNickname("쿠쿵딱");
		um.updateMember(member);
		System.out.println(member.getMemEmail());
		System.out.println(member.getMemNickname());
		System.out.println(member.getMemBirthday());
	}
	
	@Test
	public void updateTeamMembertest() {
		//updateMember 이후 나온 MemberDomain 객체로 업데이트가 되는가를 테스트하는거임 
		MemberDomain member = new MemberDomain();
		member.setMemId(5L);
		um.updateMember(member);
		um.updateTeamMember(member);
	}
	
	@Test
	public void updateMeetMemberTest() {
		MemberDomain member = new MemberDomain();
		member.setMemId(5L);
		um.updateMember(member);
		um.updateTeamMember(member);
		um.updateMeetMember(member);
	}

}
