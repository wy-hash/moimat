package com.breaktheice.moimat.persistence;

import java.util.ArrayList;
import java.util.List;

import com.breaktheice.moimat.domain.AreaDomain;
import com.breaktheice.moimat.domain.CertDomain;
import com.breaktheice.moimat.domain.InterestDomain;
import com.breaktheice.moimat.domain.MemberDomain;

public interface AuthMapper {
	
	public MemberDomain login(MemberDomain loginVO);
	
	
	/* --------------------------------------------- */
	
	public int join(MemberDomain memberVo);
	
	public ArrayList getInterestCodelist();
	
	public String checkMemberEmail(String email);
	
	public int insertCode(CertDomain auth);
	
	public CertDomain selectCode(CertDomain auth);
	
	public int deleteCode(String string);
	
	public int updateMember(MemberDomain member);


	public List<AreaDomain> selectAllAreas();


	public List<InterestDomain> selectAllInterest();
	
	public Long selectAreaId(String areaRegionKey);
	
}
