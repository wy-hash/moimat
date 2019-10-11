package com.breaktheice.moimat.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.breaktheice.moimat.domain.MessageVO;
import com.breaktheice.moimat.domain.TeamMemberDomain;

public interface TeamMemberMapper {
	
	public TeamMemberDomain getMember(@Param("tmemId") Long tmemId);
	//팀멤버 단순 조회 이거 괜히 따로만드는 거같은데 ..
	public List<TeamMemberDomain> getMemberList(@Param("teamId")Long teamId,@Param("keyword")String keyword);
	//이걸로 관리자설정  차단 등등 다 해먹을거임 
	public int gradeAdjust(@Param("tmemId") Long tmemId, @Param("tmemLevel") int tmemLevel);
	//단순 강퇴만 이거 ! (그냥 단순히 뭘 잘못해서 강퇴시킨게 아닐때 또는 차단시킨 이후 차단 해제할때)
	public int getOut(@Param("tmemId") Long tmemId);
	//메세지 (임시) (등급 조정이나 강퇴 뭐 이런거 당했을때 보내주는거)
	public int teamMemberNotify(@Param("message")MessageVO messageVO,@Param("tmemId")Long tmemId);
	//체크박스를 이용한 동시에 삭제하는것 ..
	public int selectedMemberDelete(@Param("tmemIds")List<Long> tmemIds);
	
	public int memberUpdate(@Param("tmemIds")List<Long> tmemIds,@Param("level") int level);
	
	public Long getMemId(Long tmemId);
	
	public Boolean isMaster(@Param("teamId")Long teamId, @Param("memId")Long memId);
	
	public int changeMaster(@Param("tmemId")Long tmemId,@Param("teamId")Long teamId);
	
	public Boolean isAdmin(@Param("teamId")Long teamId, @Param("memId")Long memId);
}