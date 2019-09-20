package com.breaktheice.moimat.persistence;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.breaktheice.moimat.domain.PhotoDomain;

public interface PhotoMapper {

	public PhotoDomain selectBoardOne(@Param("seq")String seq);
	public List<PhotoDomain> selectBoardList();
	public void insertBoard(PhotoDomain domain);
	public void deleteBoard(PhotoDomain domain);
	public void modifyBoard(PhotoDomain domain);
	public void replyUPBoard(PhotoDomain domain);
	
	public void replyBoard(PhotoDomain domain);	
	 
	public void replyFKBoard(PhotoDomain domain);
	
	
	public void replydeleteBoard(PhotoDomain domain);
	public void replydeleteBoard2(PhotoDomain domain);
	
	public void photodeleteBoard(PhotoDomain domain);
	public void photoUPBoard(PhotoDomain domain);
	
//	public String restore(List<MultipartFile> files,PhotoDomain domain);
//	public String genSaveFileName(String extName,PhotoDomain domain);
//	public boolean writeFile(MultipartFile multipartFile, String saveFileName,PhotoDomain domain) throws IOException;
//	
	
	
}
