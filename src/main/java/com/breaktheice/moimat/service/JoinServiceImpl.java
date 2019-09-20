package com.breaktheice.moimat.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.persistence.JoinMapper;
import com.google.gson.Gson;

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
	@Override
	public ArrayList getInterestCodeList() {
		
		log.info("getInterestCodeList()");
		
		return joinMapper.getInterestCodelist();
		
		
	}
	
	/**
	 * 회원 정보 등록
	 * 
	 * @param MemberDomain
	 * @return Boolean
	 * @throws
	 */
	@Override
	public boolean joinMember(MemberDomain vo) {
		
		int success = joinMapper.join(vo);	// Member테이블 삽입
		int success2 = joinMapper.insertInterest(vo); // MemberInterest테이블 삽입
		
		
		if(success == 1) {
			
			
			return true;
		}
		
		return false;
	}
	
	
	/**
	 * id 중복조회
	 *  
	 * @param 
	 * @return 
	 * @throws
	 */
	@Override
	public Map checkId(String id) {
		
		// db에서 회원정보 갖고온다
		String result = joinMapper.checkMemberId(id);
		
		//GSon
		Gson gson = new Gson();
		
		//Map
		Map map = new HashMap();
		
		// id 중복이 있는경우 있는경우(중복)
		if(result != null && !result.equals("")) {
			map.put("checkCode", 1);
			map.put("checkMsg", "Id가 중복됩니다");
		}else { // id 중복이 없는 경우
			map.put("checkCode", 0);
			map.put("checkMsg", "사용할 수 있는 아이디 입니다");
		}
		
		return map;
			
	}
	
	
}
