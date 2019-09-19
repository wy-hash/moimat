package com.breaktheice.moimat.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.MemberVO;
import com.breaktheice.moimat.persistence.JoinMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class JoinServiceImpl implements JoinService {
	
	
	@Autowired
	JoinMapper joinMapper;
	

	/**
	 * Interest에서 데이터 갖고오는 서비스
	 * @param
	 * @return ArrayList
	 * @throws
	 */
	public ArrayList getInterestCodeList() {
		
		log.info("getInterestCodeList()");
		
		return joinMapper.getInterestCodelist();
		
		
	}
	
	/**
	 * 회원 정보 등록
	 * 
	 * @param MemberVO
	 * @return Boolean
	 * @throws
	 */
	public boolean joinMember(MemberVO vo) {
		
		int success = joinMapper.join(vo);	// Member테이블 삽입
		int success2 = joinMapper.insertInterest(vo); // MemberInterest테이블 삽입
		
		
		if(success == 1) {
			
			
			return true;
		}
		
		return false;
	}
	
	
}
