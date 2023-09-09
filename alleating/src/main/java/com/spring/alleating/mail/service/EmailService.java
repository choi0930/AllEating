package com.spring.alleating.mail.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.spring.alleating.member.vo.MemberVO;
@Service("emailService")
public class EmailService {
	
	private final JavaMailSender javaMailSender;
	
	private static final String senderEmail = "";
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
	public MimeMessage createFindPwdMail(String email, String name) {
		createNumber();
		MimeMessage message = javaMailSender.createMimeMessage();
		try {
			message.setFrom(senderEmail);
			message.setRecipients(MimeMessage.RecipientType.TO, email);
			message.setSubject("AllEating");
			String body="";
			body+="<h3>"+name+"님 안녕하세요. 올잇팅입니다."+"</h3>";
			body+="<h3>"+"아래 버튼을 눌러 비밀번호를 재설정해 주세요"+"</h3>";
			body+="<a href='http://localhost:8080/member/updatePwd.do'>";
			body+="<img src=\"https://res.kurly.com/images/edm/2021/1005/btn_password_change.png\" width=\"170\" height=\"44\" alt=\"비밀번호 재설정\" border=\"0\" style=\"display:block\" loading=\"lazy\">";
			body+="</a>";
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
	
	public void updatePwdLinkSendMail(MemberVO memberVO) {
		String email = memberVO.getEmail();
		String name = memberVO.getName();
		MimeMessage message = createFindPwdMail(email, name);
		javaMailSender.send(message);
		
		
	}
}
