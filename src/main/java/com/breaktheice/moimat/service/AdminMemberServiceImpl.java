package com.breaktheice.moimat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.persistence.MemberMapper;
import com.breaktheice.moimat.util.AdminCriteria;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public Long totalCount(AdminCriteria cri) {
		// 회원  가입자 수
		return mapper.totalCount(cri);
	}

	@Override
	public List<MemberDomain> list(AdminCriteria cri) {
		// 회원 목록
		return mapper.list(cri);
	}

	@Override
	public MemberDomain view(MemberDomain domain) {
		// 회원 상세
		return mapper.view(domain);
	}

	@Override
	public Long add(MemberDomain domain) {
		// 회원 추가
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
	public Long update(MemberDomain domain) {
		// 회원 수정
		log.info("회원 수정");
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
	public Long remove(MemberDomain domain) {
		
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
	public Long selectAreaId(String areaRegionKey) {
		// 선택한 지역코드로 지역의 PK값 가져옴
		return mapper.selectAreaId(areaRegionKey);
	}
	
	@Override
	public Long changeLevel(MemberDomain domain) {
		// 등급변경
		return mapper.changeLevel(domain);
	}

	@Override
	public Long changeStatus(MemberDomain domain) {
		// 상태변경
		return mapper.changeStatus(domain);
	}
}
