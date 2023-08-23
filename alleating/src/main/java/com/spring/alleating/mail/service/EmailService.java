package com.spring.alleating.mail.service;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("emailService")
public class EmailService {
	
	private final JavaMailSender javaMailSender;
	
	private static final String senderEmail = "alan0930@naver.com";
	private static int number;
	@Autowired
	public EmailService(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }
	
	/* 회원가입 이메일 인증번호 */
	private static void createNumber() {
		number = (int)(Math.random() * (90000))+100000;
	}
	/* 회원가입 이메일 인증 메시지 */
	public MimeMessage createMail(String email) {
		createNumber();
		MimeMessage message = javaMailSender.createMimeMessage();
		try {
			message.setFrom(senderEmail);
			message.setRecipients(MimeMessage.RecipientType.TO, email);
			message.setSubject("AllEating 이메일 인증");
			String body="";
			body+="<h3>"+"요청하신 인증 번호입니다."+"</h3>";
			body+="<h1>"+ number+"</h1>";
			body+="<h3>"+ "감사합니다"+"</h3>";
			message.setText(body,"UTF-8","html");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	public MimeMessage createFindIdMail(String email, String id) {
		createNumber();
		MimeMessage message = javaMailSender.createMimeMessage();
		try {
			message.setFrom(senderEmail);
			message.setRecipients(MimeMessage.RecipientType.TO, email);
			message.setSubject("AllEating 아이디");
			String body="";
			body+="<h3>"+"회원님의 아이디 입니다."+"</h3>";
			body+="<h1>"+id+"</h1>";
			message.setText(body,"UTF-8","html");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	/* 회원가입 이메일 인증 */
	public int sendMail(String email) {
		MimeMessage message = createMail(email);
		javaMailSender.send(message);
		return number;
	}
	/* 아이디 찾기 이메일 인증 */
	public void sendMailFindId(String email, String id) {
		
	}
	
}
