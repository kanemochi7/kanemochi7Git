package com.project.kanemochi;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.kanemochi.util.Mail;
import com.project.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private Mail mail = new Mail();
	
	
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
		return "loginForm";
	}
	
	@RequestMapping(value = "findId", method = RequestMethod.GET)
	public String findPwd(String email) {
		MemberVO vo = new MemberVO();
		vo.setEmail(email);
		return "loginForm";
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(Locale locale, Model model) {
		return "loginForm";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String id,String pwd,HttpSession session) {
		session.setAttribute("loginid", id);
		session.setAttribute("loginName",pwd );//꼭고칠것!!!!!!!!!!!!!!! DB연결후 
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
	
	@RequestMapping(value = "characterSelect", method = RequestMethod.GET)
	public String characterSelect() {
		return "characterSelect";
	}
	
	@RequestMapping(value = "memberListForm", method = RequestMethod.GET)
	public String memberListForm() {
		return "memberListForm";
	}
	
	@RequestMapping(value = "checkForm", method = RequestMethod.GET)
	public String tempCheckForm(String num,String email,RedirectAttributes re) {
		re.addFlashAttribute("email", email);
		re.addFlashAttribute("checkNum", num);
		return "redirect:/member/check";
	}
	
	@RequestMapping(value = "check", method = RequestMethod.GET)
	public String check() {
		return "check";
	}
	
	@RequestMapping(value = "reportForm", method = RequestMethod.GET)
	public String reportForm() {
		return "report";
	}
	
	@RequestMapping(value = "idDuplCheck", method = RequestMethod.GET)
	@ResponseBody
	public void idDuplCheck() {
		
	}
	
	@RequestMapping(value = "emailCheck", method = RequestMethod.GET)
	@ResponseBody
	public int emailCheck(String email) {
		int number = mail.emailCheck(email);
		return number;
	}
	
}
