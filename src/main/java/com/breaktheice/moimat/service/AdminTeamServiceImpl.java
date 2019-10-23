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
import com.breaktheice.moimat.util.AdminCriteria;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminTeamServiceImpl implements AdminTeamService {

	@Autowired
	private TeamMapper mapper;
	
	//for indexpage
	@Override
	public List<TeamDomain> getRandomList() {
		// TODO Auto-generated method stub
		return mapper.getRandomList();
	}

	@Override
	public Long totalCount(AdminCriteria cri) {
		return mapper.totalCount(cri);
	}

	@Override
	public List<TeamDomain> list(AdminCriteria cri) {
		// 모임 목록
		return getInfo(mapper.list(cri));
	}

	@Override
	public TeamDomain view(TeamDomain domain) {
		// 모임 상세
		TeamDomain result = mapper.view(domain);
		result.setIntName(mapper.getInterest(result));
		result.setMemNickName(mapper.getNickname(result));
		result.setAreaRegionName(mapper.getArea(result));
		return result;
	}

	@Override
	public Long add(TeamDomain domain, MemberDomain member) {
		Long result = -1L;// 결과값 : 정상등록 : 1, 실패 : -1
		
		result = mapper.add(domain);
		
		if(result >= 1) {
			log.info(result + "/" + domain.getTeamId());
			addGroupMaster(domain.getTeamId(), member); // 등록된 모임의 teamId와 세션에 들어있던 회원정보를 사용하여 모임장도 등록한다. 
			log.info("정상 등록 되었습니다.");
		} else {
			log.info("등록실패 / 에러");
		}
		
		return result;
	}	
	// 모임 등록시 모임장으로 추가
	public Long addGroupMaster(Long teamId, MemberDomain member) {// 
		Long result = -1L;// 결과값 : 정상등록 : 1, 실패 : -1
		
		HashMap<String , Object> map = new HashMap<String, Object>();
		
		
		map.put("teamId", teamId);
		map.put("m", member);
		
		result = mapper.addGroupMaster(map);
		
		if(result >= 1) {
			log.info("정상 등록 되었습니다.");
		} else {
			log.info("등록실패 / 에러");
		}
		
		return result;
	}	

	@Override
	public Long update(TeamDomain domain) {
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
	public Long remove(TeamDomain domain) {
		Long result = -1L;// 결과값 : 정상등록 : 1, 실패 : -1

		result = mapper.remove(domain);// 게시글 수정
		
		if(result >= 1L) {
			log.info("정상 삭제 되었습니다.");
		} else {
			log.info("삭제실패 / 에러");
		}
		
		return result;
	}

	@Override
	public String getInterest(TeamDomain domain) {
		// 선택한 관심사명
		return mapper.getInterest(domain);
	}

	@Override
	public String getArea(TeamDomain domain) {
		// 선택한 지역명
		return mapper.getArea(domain);
	}

	@Override
	public String getNickname(TeamDomain domain) {
		// 모임 생성자명
		return mapper.getNickname(domain);
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
	
	
	public List<TeamDomain> getInfo(List<TeamDomain> list) {
		for(TeamDomain domain : list){
			domain.setIntName(mapper.getInterest(domain));
			domain.setMemNickName(mapper.getNickname(domain));
			domain.setAreaRegionName(mapper.getArea(domain));
		}
        return list;
	  }

	@Override
	public List<TeamDomain> recentOneWeek(AdminCriteria cri) {
		// 최근 일주일간 등록된 모임 목록
		return getInfo(mapper.recentOneWeek(cri));
	}

}
