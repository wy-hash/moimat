package com.breaktheice.moimat.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.UserInfoVO;
import com.breaktheice.moimat.persistence.AuthMapper;
import com.breaktheice.moimat.persistence.UserMapper;
import com.breaktheice.moimat.util.SHA256;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Service
@AllArgsConstructor
@Log4j
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	AuthMapper authMapper;
	
	@Autowired
	SHA256 sha256;

	@Override
	public MemberDomain selectUserDomain(String memEmail) {
		
		return userMapper.selectMember(memEmail);
	}
	
	@Override
	public boolean checkPassword(MemberDomain memberDomain) {		// 패스워드 체크 여부 확인
		log.info(memberDomain);
		
		String password = sha256.encrypt(memberDomain.getMemPassword());

		MemberDomain member = authMapper.login(memberDomain.getMemEmail());
		
		log.info(member);
		if(password.equals(member.getMemPassword())) {
			return true;
		}	
		
		return false;
	}
	
	public boolean updateMember(MemberDomain member) {

		int cnt = userMapper.updateMember(member);
		userMapper.updateTeamMember(member);
		userMapper.updateMeetMember(member);
		
		log.info("update result: " + member);
		if (cnt == 1) {
			return true;
		}
		return false;
	}
	
	public boolean dropMember(MemberDomain member) {
		
		log.info("withdrawMember: " + member);
		int cnt = userMapper.dropMember(member);
		if (cnt == 1) {
			return true;
		}
		return false;
	}

	@Override
	public UserInfoVO getUserInfoPage(Long memId) {
		UserInfoVO uiv = new UserInfoVO();
		MemberDomain md = userMapper.getUserInfo(memId);
		uiv.setMemberDomain(md);
		uiv.setPostDomain(userMapper.getRecentPost(md.getMemEmail()));
		uiv.setTeamDomain(userMapper.getRecentGroup(memId));
		List<InterestDomain> interst = userMapper.getInterest();
		Map<Long, String> intMap = new HashMap<Long, String>();
		for (InterestDomain interestDomain : interst) {
			intMap.put(interestDomain.getIntId(), interestDomain.getIntName());
		}
		uiv.setIntMap(intMap);
		List<AreaDomain> area = userMapper.getArea();
		Map<Long, String> areaMap = new HashMap<Long,String>();
		for (AreaDomain areaDomain : area) {
			String areaFullName = areaDomain.getAreaName()+" "+areaDomain.getAreaRegionName();
			areaMap.put(areaDomain.getAreaId(),areaFullName);
		}
		uiv.setAreaMap(areaMap);
		
		return uiv;
	}

	@Override
	public MemberDomain getMemberDomain(Long memId) {
		
		return userMapper.getUserInfo(memId);
	}

	@Override
	public boolean isTeamMaster(MemberDomain memberDomain) {
		// TODO Auto-generated method stub
		return userMapper.isTeamMaster(memberDomain);
	}
	
	
	
	
}
