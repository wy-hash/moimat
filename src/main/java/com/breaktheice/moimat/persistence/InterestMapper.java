package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.util.AdminCriteria;

public interface InterestMapper {
	public Long totalCount(AdminCriteria cri);			// 관심사 코드 전체 개수
	public List<InterestDomain> listAll();				// 관심사 코드 목록 (전체)
	public List<InterestDomain> list(AdminCriteria cri);// 관심사 코드 목록 (검색)
	public InterestDomain view(InterestDomain domain);	// 관심사 코드 상세보기
	public Long add(InterestDomain domain);				// 관심사 코드 추가하기
	public Long update(InterestDomain domain);			// 관심사 코드 수정하기
	public Long remove(InterestDomain domain);			// 관심사 코드 삭제하기
	public Long keyCheck(InterestDomain domain);		// 관심사 코드 중복체크
	public Long selectInterestId(String intKey);
}
 