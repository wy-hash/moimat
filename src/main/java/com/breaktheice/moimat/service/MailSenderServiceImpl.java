package com.breaktheice.moimat.service;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.breaktheice.moimat.persistence.JoinMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MailSenderServiceImpl implements MailSenderService{
	
	@Autowired
	JavaMailSender mailSender;

	@Override
	public void simpleMailSend(String setFrom, String setTo, String setSubject, String setText) {

		SimpleMailMessage message = new SimpleMailMessage();

		message.setFrom(setFrom);			// 발신자 메일주소 ex) aaaa@dddd.com
		message.setTo(setTo);				// 수신자 메일주소 ex) cccc@dddd.com
		message.setSubject(setSubject);		// 메일제목 ex) 회원가입안내
		message.setText(setText);			// 메일 내용 ex) 회원가입이 거절되었습니다.

		mailSender.send(message);

		System.out.println("발송 완료");

	}
	@Override
	public void htmlMailSend() {

		MimeMessage message = mailSender.createMimeMessage();

		try {
			// 제목설정
			message.setSubject("[안내] 회원 가입 안내", "utf-8");

			// 내용 구성 ( HTML )
			String html = "<h1>안녕하세요 회원님</h1> 회원 가입을 진심으로 감사드립니다.<br>" + " 재 방문을 원하실 경우 아래 링크를 클릭해 주세요. <br><br>"
					+ "<a href=\"http://localhost/op\">사이트 가기</a>";
			// 내용 설정
			message.setText(html, "utf-8", "html");

			// 보내는 사람의 메일 설정
			message.setFrom(new InternetAddress("aaa@naaa.com"));

			// 받는 사람의 메일 설정
			message.addRecipient(RecipientType.TO, new InternetAddress("aaa@aaa"));

			mailSender.send(message);

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}

	}
	@Override
	public void fileMailSend() {

		MimeMessage message = mailSender.createMimeMessage();

		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			// 제목 설정
			messageHelper.setSubject("[공지] 안녕하세요 회원님.");
			
			// 내용 구성 ( HTML )
			String html = "<h1>안녕하세요 회원님</h1> 회원 가입을 진심으로 감사드립니다.<br>" 
					+ " 재 방문을 원하실 경우 아래 링크를 클릭해 주세요. <br><br>"
					+ "<a href=\"http://localhost/op\">사이트 가기</a>";
			
			// 내용 설정
			messageHelper.setText(html, true);
			
			// 보내는 사람의 메일 설정
			messageHelper.setFrom("aaa@naaaate.com", "aaa");
			
			// 받는 사람의 메일 설정
			messageHelper.setTo(new InternetAddress("aaa@aaa.com", "jin 회원님", "utf-8"));
			
			// 파일 첨부 설정
			DataSource source = new FileDataSource("C:\\Users\\aaaa\\aaa\\설명.txt");
			messageHelper.addAttachment(MimeUtility.encodeText("설명.txt", "UTF-8", "B"), source);
			
			mailSender.send(message);
						
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
