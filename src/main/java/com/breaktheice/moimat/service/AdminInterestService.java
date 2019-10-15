package com.breaktheice.moimat.service;

import java.util.List;

import com.breaktheice.moimat.domain.InterestDomain;

public interface AdminInterestService {

	public List<InterestDomain> list();// 관심사 목록
	public InterestDomain view(InterestDomain domain);// 관심사 상세보기
	public Long add(InterestDomain domain);// 관심사 추가
	public Long update(InterestDomain domain);// 관심사 수정
	public Long remove(InterestDomain domain);// 관심사 삭제
	public boolean keyCheck(InterestDomain domain);// 관심사 코드 중복 체크
}
