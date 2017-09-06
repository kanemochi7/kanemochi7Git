package com.project.kanemochi.util;

import java.io.UnsupportedEncodingException;
import java.util.Properties ;
import java.util.Random;

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
	
	public void sendMail(String email) {
		//보내는 서버 주소
		String host = "smtp.naver.com";
		//메일 제목 설정
		String subject = "ID / 電話番号 "; 
		//보내는 사람 이메일 주소
		String from = "kyh0975@naver.com"; 
		//보내는사람 이름
		String writer = "test test"; 
		//받는사람 이메일주소
		String to = "kongkongup@gmail.com";
		
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", host);
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory" );
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.user", from);
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			@Override
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("kyh0975@naver.com","vmfkdla3438");
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
		int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
		//보내는 서버 주소
		String host ="smtp.naver.com";
		//메일 제목 설정
		String subject = "KANEMOCHI 인증번호! "; 
		//보내는 사람 이메일 주소
		String from = "kyh0975@naver.com"; 
		//보내는사람 이름
		String writer = "test test"; 
		//받는사람 이메일주소
		String to = email;
		
		StringBuffer content = new StringBuffer();
		content.append("KANEMOCHI");
		content.append("<br>");
		content.append("인증번호는 ");
		content.append(ran);
		
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", host);
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory" );
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.user", from);
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new Authenticator() {
			@Override
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from,"vmfkdla3438");
			}
		});
		
		Message msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(writer, "UTF-8", "B")));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			msg.setSubject(subject);
			msg.setContent(content.toString(), "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (MessagingException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return ran;
	}
}
