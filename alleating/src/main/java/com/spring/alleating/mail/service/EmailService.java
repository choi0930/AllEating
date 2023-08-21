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
	private static void createNumber() {
		number = (int)(Math.random() * (90000))+100000;
	}
	
	public MimeMessage createMail(String email) {
		createNumber();
		MimeMessage message = javaMailSender.createMimeMessage();
		try {
			message.setFrom(senderEmail);
			message.setRecipients(MimeMessage.RecipientType.TO, email);
			message.setSubject("�씠硫붿씪 �씤利�");
			String body="";
			body+="<h3>"+ "�슂泥��븯�떊 �씤利� 踰덊샇�엯�땲�떎."+"</h3>";
			body+="<h1>"+ number+"</h1>";
			body+="<h3>"+ "媛먯궗�빀�땲�떎"+"</h3>";
			message.setText(body,"UTF-8","html");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	public int sendMail(String email) {
		MimeMessage message = createMail(email);
		javaMailSender.send(message);
		return number;
	}
	
}
