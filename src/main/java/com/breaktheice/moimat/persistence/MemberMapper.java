package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.AdminVO;
import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.util.AdminCriteria;

public interface MemberMapper {
	
	// 전체 회원 수 
	public Long totalCount(AdminCriteria cri);
	
	// 회원 목록
	public List<MemberDomain> list(AdminCriteria cri);
	// 회원 상세
	public MemberDomain view(MemberDomain domain);
	// 회원 추가
	public Long add(MemberDomain domain);
	// 회원 수정
	public Long update(MemberDomain domain);
	// 회원 삭제
	public Long remove(MemberDomain domain);
	
	// 관심지역
	public List<AreaDomain> selectAllAreas();
	// 관심사
	public List<InterestDomain> selectAllInterest();
	// 내가 선택한 관심사의 번호
	public Long selectAreaId(String areaRegionKey);

	// 등급 변경
	public Long changeLevel(MemberDomain domain);
	// 상태 변경
	public Long changeStatus(MemberDomain domain);
	// 이메일 중복체크
	public Long emailCheck(MemberDomain domain);
	// 가입일자 별로 카운트
	public List<AdminVO> regdateCount();

	// 관심사전체 순위 카운트
	public List<AdminVO> interestCount();
	
	// 전체 지역 카운트
	public List<AdminVO> areaCount();
}
