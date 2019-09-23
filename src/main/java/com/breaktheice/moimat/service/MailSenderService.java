package com.breaktheice.moimat.service;

public interface MailSenderService {
	
	public void simpleMailSend(String setFrom, String setTo, String setSubject, String setText);
	
	public void htmlMailSend();
	
	public void fileMailSend();
	
	
}
