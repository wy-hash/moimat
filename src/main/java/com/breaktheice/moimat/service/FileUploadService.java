package com.breaktheice.moimat.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {

	public String restore(MultipartFile multipartFile);

	String saveFile(String caller, MultipartFile file);
	
}
