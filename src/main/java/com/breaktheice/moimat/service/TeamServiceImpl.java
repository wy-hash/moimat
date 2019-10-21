package com.breaktheice.moimat.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.TeamDomain;
import com.breaktheice.moimat.persistence.TeamMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class TeamServiceImpl implements TeamService {

	@Autowired
	private TeamMapper mapper;
	
	//for indexpage
	@Override
	public List<TeamDomain> getRandomList() {
		// TODO Auto-generated method stub
		return mapper.getRandomList();
	}

	@Override
	public List<TeamDomain> getJoinedGroupList(MemberDomain member) {
		// TODO Auto-generated method stub
		
		List<TeamDomain> td = mapper.selectJoinedGroupList(member.getMemId());
		
		log.info(td);
		
		return td;
	}

	@Override
	public TeamDomain getGroupInfo(Long groupId) {

		return mapper.selectTeamInfo(groupId);
	}

	@Override
	public Long add(TeamDomain domain) {
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
	public Long addGroupMaster(TeamDomain team, MemberDomain member) {// 
		Long result = -1L;// 결과값 : 정상등록 : 1, 실패 : -1
		
		HashMap<String , Object> map = new HashMap<String, Object>();
		
		Long teamId = mapper.getTeamid(team);
		
		map.put("teamId", teamId);
		map.put("m", member);
		
		result = mapper.addGroupMaster(map);
		
		if(result >= 1) {
			log.info("정상 등록 되었습니다.");
		} else {
			log.info("등록실패 / 에러");
		}

//		team_member_seq.nextval(), #{teamId}, #{m.memId}, 9, '모임장 입니다',  회원정보는 세션으로 넣어줄 예정
//		 #{tmemNickname}, #{tmemEmail}, sysdate, sysdate,
//		 #{tmemBirthday}, #{tmemGender}, #{tmemPhoto}
		return result;
	}	

	@Override
	public List<AreaDomain> selectAllAreas() {
		// 전체 지역
		return mapper.selectAllAreas();
	}

	@Override
	public List<InterestDomain> selectAllInterest() {
		// 전체 관심사
		return mapper.selectAllInterest();
	}
}
