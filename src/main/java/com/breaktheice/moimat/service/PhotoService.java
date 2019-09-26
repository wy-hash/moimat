 package com.breaktheice.moimat.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.breaktheice.moimat.domain.PhotoDomain;
import com.breaktheice.moimat.page.Criteria;

public interface PhotoService {
	
	public PhotoDomain selectBoardOne(String seq);
	public List<PhotoDomain> selectBoardList();
	public void insertBoard(PhotoDomain domain);
	public void deleteBoard(PhotoDomain domain);
	public void modifyBoard(PhotoDomain domain);
	
	
	public void replyUPBoard(PhotoDomain domain);
	public void replyBoard(PhotoDomain domain);
	public void replydeleteBoard(PhotoDomain domain);
	
	
	public void photoinsertBoard(PhotoDomain domain);
	public void photodeleteBoard(PhotoDomain domain);
	
	
	//파일업로드
	public int selectAllBoard() throws Exception;
	
	  public List<PhotoDomain> selectBoardListPage(Criteria criteria) throws Exception;
	
	public String restore(List<MultipartFile> files,PhotoDomain domain);
	public String genSaveFileName(String extName,PhotoDomain domain);
	public boolean writeFile(MultipartFile multipartFile, String saveFileName,PhotoDomain domain) throws IOException;
	public void photoUPBoard(PhotoDomain domain);
	
	

}
