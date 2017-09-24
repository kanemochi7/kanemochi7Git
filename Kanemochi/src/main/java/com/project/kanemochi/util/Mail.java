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

import com.project.kanemochi.vo.MemberVO;

public class Mail extends Authenticator {
	
	
	//비밀번호, 아이디 찾아주는 용도로 쓰일것.
	public boolean sendInfo(MemberVO vo,String menu) {
		System.out.println(vo);
		System.out.println(menu);
		//보내는 서버 주소
		String host = "smtp.naver.com";
		//메일 제목 설정
		String subject = "ID / 電話番号 "; 
		//보내는 사람 이메일 주소
		String from = "kyh0975@naver.com"; 
		//보내는사람 이름
		String writer = "test test"; 
		//받는사람 이메일주소
		String to = vo.getUser_email();
		
		StringBuffer message = new StringBuffer();
		message.append("<KANAEMOCHI>");
		message.append("<br>");
		if(menu.equals("id")){
			message.append("ID: ");
			message.append(vo.getUser_id());
			message.append("<br>");			
		}else if(menu.equals("pw")){
			message.append("password: ");
			message.append(vo.getUser_pw());
			message.append("<br>");
		}
		
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
			msg.setContent(message.toString(), "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (MessagingException | UnsupportedEncodingException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	
	public int emailCheck(String email) {
		int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
		//보내는 서버 주소
		String host ="smtp.naver.com";
		//메일 제목 설정
		String subject = "KANEMOCHIのメール認証番号です! "; 
		//보내는 사람 이메일 주소
		String from = "kyh0975@naver.com"; 
		//보내는사람 이름
		String writer = "test test"; 
		//받는사람 이메일주소
		String to = email;
		
		StringBuffer content = new StringBuffer();
		content.append("KANEMOCHI");
		content.append("<br>");
		content.append("認証番号 : ");
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
