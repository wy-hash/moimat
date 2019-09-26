 package com.breaktheice.moimat.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.breaktheice.moimat.domain.PhotoDomain;
import com.breaktheice.moimat.page.Criteria;
import com.breaktheice.moimat.persistence.PhotoMapper;

import lombok.AllArgsConstructor;
@Service
@AllArgsConstructor
public class PhotoServiceImpl implements PhotoService{
	private PhotoMapper mapper;
	static final String SAVE_PATH = "C:\\git\\moimat\\resources\\FileUpload";
	static final String PREFIX_URL = "/upload/";
	
	//페이징
	  public List<PhotoDomain> selectBoardListPage(Criteria criteria) throws Exception {
			return mapper.selectBoardListPage(criteria);
	    }
	
	//파일업로드
	public int selectAllBoard() throws Exception {
		
		return mapper.selectAllBoard();
    }

	public String restore(List<MultipartFile> files,PhotoDomain domain) {
		String url = null;
		
		for (MultipartFile multipartFile : files) {
	
			try {
				// 파일 정보
				String originFilename =  multipartFile.getOriginalFilename();
				String extName 
					= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
				Long size = (long) files.size();
				
				// 서버에서 저장 할 파일 이름
				String saveFileName = genSaveFileName(originFilename+extName, domain);
				
				System.out.println("originFilename : " + originFilename);
				System.out.println("extensionName : " + extName);
				System.out.println("size : " + size);
				System.out.println("saveFileName : " + saveFileName);
				
				writeFile(multipartFile, saveFileName, domain);
				url = PREFIX_URL + saveFileName;
				
				//업로드 성공시
				
				photoinsertBoard(domain);
				domain.setPfiOriginname(saveFileName);
				
			}
			catch (IOException e) {
				// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
				// 편의상 RuntimeException을 던진다.
				// throw new FileUploadException();	
				throw new RuntimeException(e);
			}
			
		}
		
		return url;
		
	}
	public String genSaveFileName(String extName,PhotoDomain domain) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}
	public boolean writeFile(MultipartFile multipartFile, String saveFileName,PhotoDomain domain) 														//파일이름변수
																		throws IOException {
		boolean result = false;

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(data);
		fos.close();

		return result;
}
	//게시물 리스트
	public List<PhotoDomain> selectBoardList() {
	
		return mapper.selectBoardList();
	}
	//게시물 상세보기
	public PhotoDomain selectBoardOne(String seq) {
		
		return mapper.selectBoardOne(seq);
	}

	//게시물 생성
	public void insertBoard(PhotoDomain domain) {
		mapper.insertBoard(domain);
	}
	//게시물 삭제
	public void deleteBoard(PhotoDomain domain) {
		mapper.deleteBoard(domain);
	}
	//게시물수정
	public void modifyBoard(PhotoDomain domain) {
		mapper.modifyBoard(domain);
	}
	//댓글 생성
	public void replyBoard(PhotoDomain domain) {
		
		mapper.replyBoard(domain);
		}
	//댓글 수정
	public void replyUPBoard(PhotoDomain domain) {
		
		mapper.replyUPBoard(domain);
		
	}
	//댓글삭제
	public void replydeleteBoard(PhotoDomain domain) {
		
		mapper.replydeleteBoard(domain);
		mapper.replydeleteBoard2(domain);
	}
	public void photodeleteBoard(PhotoDomain domain) {

		mapper.photodeleteBoard(domain);
}
	public void photoUPBoard(PhotoDomain domain) {
		
		mapper.photoUPBoard(domain);
		
	}
	//사진및 파일 첨부
	public void photoinsertBoard(PhotoDomain domain) {
		
		mapper.photoinsertBoard(domain);
	}
}
