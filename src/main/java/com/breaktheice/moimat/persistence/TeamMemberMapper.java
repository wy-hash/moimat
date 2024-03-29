package com.breaktheice.moimat.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.breaktheice.moimat.domain.MemberDomain;
import com.breaktheice.moimat.domain.TeamMemberDomain;
import com.breaktheice.moimat.util.AdminCriteria;

public interface TeamMemberMapper {
	
	public TeamMemberDomain getMember(@Param("tmemId") Long tmemId);
	//팀멤버 단순 조회 이거 괜히 따로만드는 거같은데 ..
	public List<TeamMemberDomain> getMemberList(@Param("teamId")Long teamId,@Param("status")String status,@Param("cri")AdminCriteria cri);
	//이걸로 관리자설정  차단 등등 다 해먹을거임 
	public int getMemberTotal(@Param("teamId")Long teamId,@Param("status")String status,@Param("cri")AdminCriteria cri);
	//토탈
	public int gradeAdjust(@Param("tmemId") Long tmemId, @Param("tmemLevel") int tmemLevel);
	//단순 강퇴만 이거 ! (그냥 단순히 뭘 잘못해서 강퇴시킨게 아닐때 또는 차단시킨 이후 차단 해제할때)
	public int getOut(@Param("tmemId") Long tmemId);
	//체크박스를 이용한 동시에 삭제하는것 ..
	public int selectedMemberDelete(@Param("tmemIds")List<Long> tmemIds);
	
	public int memberUpdate(@Param("tmemIds")List<Long> tmemIds,@Param("level") int level);
	
	public Long getMemId(Long tmemId);
	
	public Boolean isMaster(@Param("teamId")Long teamId, @Param("memId")Long memId);
	
	public int changeMaster(@Param("tmemId")Long tmemId,@Param("teamId")Long teamId);
	
	public Boolean isAdmin(@Param("teamId")Long teamId, @Param("memId")Long memId);
	
	public Long getTmemId(@Param("memId")Long memId,@Param("teamId")Long teamId);
	//모임 가입 
	public Long attendTeam(@Param("teamId")Long teamId,@Param("memId")Long memId);
	//모임 탈퇴
	public Long withdrawTeam(@Param("teamId")Long teamId,@Param("memId")Long memId);
	
	TeamMemberDomain selectMemberByTeamIdAndMemId(@Param("teamId") Long teamId, @Param("memId") Long memId);

	TeamMemberDomain selectTeamMemberDomainByTmemId(Long tmemId);
}