package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.util.AdminCriteria;

public interface AdminInterestService {
	public Long totalCount(AdminCriteria cri);			// 관심사 코드 전체 개수
	public List<InterestDomain> listAll();					// 관심사 코드 목록 (전체)
	public List<InterestDomain> list(AdminCriteria cri);	// 관심사 코드 목록
	public InterestDomain view(InterestDomain domain);	// 관심사 상세보기
	public Long add(InterestDomain domain);				// 관심사 추가
	public Long update(InterestDomain domain);			// 관심사 수정
	public Long remove(InterestDomain domain);			// 관심사 삭제
	public boolean keyCheck(InterestDomain domain);		// 관심사 코드 중복 체크
}
