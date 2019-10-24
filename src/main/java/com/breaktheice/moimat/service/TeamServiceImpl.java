package com.breaktheice.moimat.service;

import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.TeamDomain;
import com.breaktheice.moimat.domain.TeamInfoVO;
import com.breaktheice.moimat.domain.TeamPostDomain;
import com.breaktheice.moimat.persistence.TeamMapper;
import com.breaktheice.moimat.persistence.UserMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class TeamServiceImpl implements TeamService {

	@Autowired
	private TeamMapper mapper;
	
	@Autowired
	private UserMapper userMapper;
	
	// for indexpage
	@Override
	public List<TeamDomain> getRandomList() {
		return mapper.getRandomList();// 인덱스 캐러셀 랜덤
	}

	@Override
	public List<TeamDomain> getIntRandomList(Long intId) {
		return mapper.getIntRandomList(intId);
	}

	@Override
	public List<TeamDomain> getAreaRandomList(Long areaId) {
		return mapper.getAreaRandomList(areaId);
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
	public Long add(TeamDomain domain, MemberDomain member) {
		Long result = -1L;// 결과값 : 정상등록 : 1, 실패 : -1

		result = mapper.add(domain);

		if (result >= 1) {
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

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("teamId", teamId);
		map.put("m", member);

		result = mapper.addGroupMaster(map);

		if (result >= 1) {
			log.info("정상 등록 되었습니다.");
		} else {
			log.info("등록실패 / 에러");
		}

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

	@Override
	public String getInterestName(Long intId) {
		TeamDomain domain = new TeamDomain();
		domain.setIntId(intId.intValue());
		return mapper.getInterest(domain);
	}

	@Override
	public String getAreaName(Long areaId) {
		TeamDomain domain = new TeamDomain();
		domain.setAreaId(areaId);
		return mapper.getArea(domain);
	}

	@Override
	public AreaDomain getAreaAll(Long areaId) {
		TeamDomain domain = new TeamDomain();
		domain.setAreaId(areaId);
		return mapper.getAreaAll(domain);
	}

	public TeamInfoVO settingTeamInfoVO(TeamDomain td) {
		TeamInfoVO vo = new TeamInfoVO();
		vo.setPostList(mapper.getPostDomain(td.getTeamId(),23L));
		List <TeamPostDomain> photoList = mapper.getPostDomain(td.getTeamId(), 22L);
		vo.setPostPhotoList(Thumbnail(photoList));
		vo.setCountMember(mapper.countTeamMember(td));
		vo.setInterest(mapper.getInterest(td));
		vo.setArea(mapper.getAreaFullName(td));
		return vo;
	}

	public List<TeamPostDomain> Thumbnail(List<TeamPostDomain> list) {
		// 썸네일 추출해서 썸네일 등록
		String content = "";
		String src = "";

		for (TeamPostDomain domain : list) {
			content = domain.getPostContent() == null ? "" : domain.getPostContent();

			// 패턴작업
			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); // img 태그 src 추출 정규표현식
			Matcher matcher = pattern.matcher(content);

			while (matcher.find()) {
				if (matcher.group(1) != null) {
					src = matcher.group(1);
					domain.setSrc(src);
					break;
				}
			}
		}

		return list;
	}
}
