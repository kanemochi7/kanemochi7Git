package com.project.kanemochi;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.kanemochi.util.Mail;
import com.project.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "signUpForm", method = RequestMethod.GET)
	public String signUpForm() {
		return "signUpForm";
	}
	
	@RequestMapping(value = "signup", method = RequestMethod.POST)
	public String signup() {
		System.out.println("signup");
		return "home";
	}
	
	@RequestMapping(value = "findIdPwdForm", method = RequestMethod.GET)
	public String findIdPwdForm() {
		return "findIdPwdForm";
	}
	
	@RequestMapping(value = "findIdPwd", method = RequestMethod.GET)
	public String findId(String email) {
		MemberVO vo = new MemberVO();
		vo.setEmail(email);
		Mail mail = new Mail();
		mail.sendMail(vo);
		
		return "home";
	}
	
	@RequestMapping(value = "findId", method = RequestMethod.GET)
	public String findPwd(String email) {
		MemberVO vo = new MemberVO();
		vo.setEmail(email);
		Mail mail = new Mail();
		return "home";
	}

	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(Locale locale, Model model) {
		
		return "home";
	}
	
	@RequestMapping(value = "album", method = RequestMethod.GET)
	public String album() {
		return "album";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write() {
		return "write";
	}
	
	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String myPage() {
		return "myPage";
	}
}
