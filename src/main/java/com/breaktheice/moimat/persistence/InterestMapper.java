package com.breaktheice.moimat.persistence;

import java.util.List;

import com.breaktheice.moimat.domain.InterestDomain;

public interface InterestMapper {
	public List<InterestDomain> list();					// 관심사 코드 목록
	public InterestDomain view(InterestDomain domain);	// 관심사 코드 상세보기
	public Long add(InterestDomain domain);				// 관심사 코드 추가하기
	public Long update(InterestDomain domain);			// 관심사 코드 수정하기
	public Long remove(InterestDomain domain);			// 관심사 코드 삭제하기
	public Long keyCheck(InterestDomain domain);			// 관심사 코드 중복체크
}
 