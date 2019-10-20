package com.breaktheice.moimat.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@PropertySource("classpath:path.properties")
public class FileUploadServiceImpl implements FileUploadService {

	@Value("${upload.path}")
	private String osPath;


	// 리눅스 기준으로 파일 경로를 작성 ( 루트 경로인 /으로 시작한다. )
	// 윈도우라면 workspace의 드라이브를 파악하여 JVM이 알아서 처리해준다.
	// 따라서 workspace가 C드라이브에 있다면 C드라이브에 upload 폴더를 생성해 놓아야 한다.
	private static final String SAVE_PATH = "/upload";
	private static final String PREFIX_URL = "/upload/";

	@Override
	public String restore(MultipartFile multipartFile) {
		String url = null;

		if(multipartFile == null) { return null; }
		log.info(multipartFile.getOriginalFilename());
		try {
			// 파일 정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName
				= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = multipartFile.getSize();

			// 서버에서 저장 할 파일 이름
			String saveFileName = genSaveFileName(extName);

			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);

			writeFile(multipartFile, saveFileName);
			url = PREFIX_URL + saveFileName;
		}
		catch (IOException e) {
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();
			throw new RuntimeException(e);
		}
		return url;	// 파일경로 리턴
	}


	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String extName) {
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


	// 파일을 실제로 write 하는 메서드
	private boolean writeFile(MultipartFile multipartFile, String saveFileName)
								throws IOException{
		boolean result = false;

		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(data);
		fos.close();

		return result;
	}


	@Override
	public String saveFile(String caller, MultipartFile file) {

		log.info("-------------------");
		log.info("file name: " + file.getOriginalFilename());
		log.info("file size: " + file.getSize());
		log.info("caller: " + caller);

		String subDirPath = getDirectory(caller);
		//make dir
		File specificPath = new File(osPath, subDirPath);
		log.info("upload path: " + specificPath);

		if (specificPath.exists() == false) {
			specificPath.mkdirs();
		}

		String uploadFileName = file.getOriginalFilename();
		// for IE
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString() + "_" + uploadFileName;


		File saveFile = new File(specificPath, uploadFileName);

		try {
			file.transferTo(saveFile);
		} catch(Exception e) {
			log.error(e.getMessage());
		}

		String fullPath = specificPath + File.separator + uploadFileName;
		log.info("saved path: " + fullPath);
		log.info("-------------------");

		return subDirPath + File.separator + uploadFileName;//for db insertion
	}

	private String getDirectory(String caller) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);

		//caller: 1. USER, 2. GROUP, 3. PHOTO
		String callerPath = "temp";

		if (caller.equals("USER")) {
			callerPath = "profile-photos";
		} else if (caller.equals("GROUP")) {
			callerPath = "groups";
		} else { //PHOTO
			callerPath = "posts";
		}

		//eg)
		return callerPath + File.separator + str.replace("-", File.separator);
	}
}
