package com.project.kanemochi.util;

import java.io.UnsupportedEncodingException;
import java.util.Properties ;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import com.project.vo.MemberVO;

public class Mail extends Authenticator {
	
	public void sendMail(MemberVO member) {
		//보내는 서버 주소
		String host = "smtp.gmail.com";
		//메일 제목 설정
		String subject = "ID / 電話番号 "; 
		//보내는 사람 이메일 주소
		String from = "KANEMOCHI 運営者"; 
		//보내는사람 이름
		String writer = "test test"; 
		//받는사람 이메일주소
		String to = "excusme@naver.com";
		
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", host);
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory" );
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.user", from);
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			@Override
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("kongkongup@gmail.com","vmfkdla3438");
			}
		});
		
		Message msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(writer, "UTF-8", "B")));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			msg.setSubject(subject);
			msg.setContent("테스트 메일 입니다.", "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (MessagingException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	public int emailCheck(String email) {
		
		//보내는 서버 주소
		String host = "smtp.gmail.com";
		//메일 제목 설정
		String subject = "ID / 電話番号 "; 
		//보내는 사람 이메일 주소
		String from = "KANEMOCHI 運営者"; 
		//보내는사람 이름
		String writer = "test test"; 
		//받는사람 이메일주소
		String to = "excusme@naver.com";
		
		String content = "인증번호는 ";
		
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", host);
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory" );
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.user", from);
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			@Override
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("kongkongup@gmail.com","vmfkdla3438");
			}
		});
		
		Message msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(writer, "UTF-8", "B")));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			msg.setSubject(subject);
			msg.setContent("테스트 메일 입니다.", "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (MessagingException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return 0;
	}
}
