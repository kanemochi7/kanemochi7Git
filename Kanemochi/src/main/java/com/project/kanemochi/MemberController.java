package com.project.kanemochi;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		return "loginForm";
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
		
		return "loginForm";
	}
	
	@RequestMapping(value = "findId", method = RequestMethod.GET)
	public String findPwd(String email) {
		MemberVO vo = new MemberVO();
		vo.setEmail(email);
		Mail mail = new Mail();
		return "loginForm";
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(Locale locale, Model model) {
		return "loginForm";
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

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list() {
		return "list";
	}
	
	@RequestMapping(value = "memberListForm", method = RequestMethod.GET)
	public String memberListForm() {
		return "memberListForm";
	}
	
	@RequestMapping(value = "idDuplCheck", method = RequestMethod.GET)
	@ResponseBody
	public void idDuplCheck() {
		
	}
	
	@RequestMapping(value = "emailDuplCheck", method = RequestMethod.GET)
	public String emailDuplCheck() {
		return "signUpForm";
	}
	
}
