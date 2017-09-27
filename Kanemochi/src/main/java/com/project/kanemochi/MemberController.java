package com.project.kanemochi;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.kanemochi.dao.MemberDAO;
import com.project.kanemochi.util.Mail;
import com.project.kanemochi.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	private Mail mail = new Mail();
	@Autowired
	private MemberDAO dao;
	
	//로직수행
	@RequestMapping(value = "signup", method = RequestMethod.POST)
	public String signup(MemberVO vo, Model model) {
		int result = dao.signUp(vo);
		model.addAttribute("signupResult", result);
		return "loginForm";
	}
	
	@RequestMapping(value = "findIdPwdForm", method = RequestMethod.GET)
	public String findIdPwdForm(String menu,Model model) {
		if(menu.equals("findpw")){
			model.addAttribute("menu","findpw");
		}else if(menu.equals("findinfo")){
			model.addAttribute("menu","findinfo");
		}
		return "findIdPwdForm";
	}
	
	@RequestMapping(value = "memberList", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<MemberVO> memberList() {
		ArrayList<MemberVO> members = new ArrayList<>();
		members = dao.memberList();
		return members;
	}
	
	@RequestMapping(value = "findId", method = RequestMethod.POST)
	public String findId(MemberVO vo,Model model) {
		MemberVO daoVO = dao.findId(vo);
		if(daoVO==null){
			model.addAttribute("findResult", false);
			return findIdPwdForm("findinfo", model);
		}else{
			boolean result = mail.sendInfo(daoVO,"id");
			model.addAttribute("findResult", result);				
		}
		return "loginForm";
	}
	
	@RequestMapping(value = "findPw", method = RequestMethod.POST)
	public String findPw(MemberVO vo,Model model) {
		MemberVO daoVO = dao.findPw(vo);
		if(daoVO==null){
			model.addAttribute("findResult", false);
			return findIdPwdForm("findpw", model);
		}else{
			boolean result = mail.sendInfo(daoVO,"pw");
			model.addAttribute("findResult", result);			
		}
		return "loginForm";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String user_id,String user_pw,HttpSession session,Model model) {
		MemberVO vo = new MemberVO();
		vo.setUser_id(user_id);
		vo.setUser_pw(user_pw);
		MemberVO loginVO= dao.login(vo);
		if(loginVO!=null){
			session.setAttribute("loginID", loginVO.getUser_id());
			session.setAttribute("loginName", loginVO.getUser_name());
			session.setAttribute("user_level", loginVO.getLevel_title());
			session.setAttribute("user_character", loginVO.getImg_id());
			model.addAttribute("loginResult", true);
			if(loginVO.getUser_authority()!=0){
				return "memberListForm";
			}
		}else{
			model.addAttribute("loginResult", false);
			return "loginForm";
		}
		return "mainPage";
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		if(session.getAttribute("loginID")!=null){
			session.invalidate();
		}
		return "loginForm";
	}
	
	
	@RequestMapping(value = "myPage")
	public String myPage(HttpSession session,Model model) {
		String loginId = (String) session.getAttribute("loginID");
		MemberVO vo = dao.getMember(loginId);
		System.out.println(vo);
		model.addAttribute("vo", vo);
		return "myPage";
	}
	
	@RequestMapping(value = "updateMember", method = RequestMethod.POST)
	public String updateMember(MemberVO vo,Model model) {
		System.out.println("controller: "+vo);
		int result = dao.updateMember(vo);
		if(result==1){
			model.addAttribute("updateResult", true);			
		}else{
			model.addAttribute("updateResult", false);
		}
		return "forward:/member/myPage";
	}

	@RequestMapping(value = "checkForm", method = RequestMethod.GET)
	public String tempCheckForm(String num, String user_email,RedirectAttributes re) {
		re.addFlashAttribute("user_email", user_email);
		re.addFlashAttribute("checkNum", num);
		return "redirect:/member/check";
	}
	
	@RequestMapping(value = "idDuplCheck", method = RequestMethod.GET)
	@ResponseBody
	public boolean idDuplCheck(String user_id,Model model) {
		boolean result = false;
		if(dao.checkId(user_id)==null){
			result = true;
		}
		return result;
	}
	
	@RequestMapping(value = "emailDuplCheck", method = RequestMethod.GET)
	@ResponseBody
	public boolean emailDuplCheck(String user_email,Model model) {
		boolean result = false;
		if(dao.checkEmail(user_email)==null){
			result = true;
		}
		return result;
	}

	@RequestMapping(value = "tempSignUp", method = RequestMethod.POST)
	public String tempSignUp(MemberVO vo,Model model) {
		model.addAttribute("memVO", vo);
		return "characterSelect";
	}

	@RequestMapping(value = "emailCheck", method = RequestMethod.GET)
	@ResponseBody
	public int emailCheck(String user_email) {
		int number = mail.emailCheck(user_email);
		return number;
	}
	
	@RequestMapping(value = "adminDeleteMember", method = RequestMethod.GET)
	public String adminDeleteMember(String user_id) {
		dao.deleteMember(user_id);
		return "redirect:/member/memberListForm";
	}
	
	@RequestMapping(value = "deleteMember", method = RequestMethod.GET)
	public String deleteMember(String user_id) {
		dao.deleteMember(user_id);
		return "loginForm";
	}
	
	//페이지이동
	
	
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping(value = "signUpForm", method = RequestMethod.GET)
	public String signUpForm() {
		return "signUpForm";
	}
	
	@RequestMapping(value = "screenshotForm", method = RequestMethod.GET)
	public String screenshotForm() {
		return "screenshotForm";
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
	
	@RequestMapping(value = "album", method = RequestMethod.GET)
	public String album() {
		return "album";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write() {
		return "write";
	}
	
	@RequestMapping(value = "check", method = RequestMethod.GET)
	public String check() {
		return "check";
	}
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main() {
		return "mainPage";
	}
	
	@RequestMapping(value = "snapshotTest", method = RequestMethod.GET)
	public String snapshotTest() {
		return "snapshotTest";
	}
	
	@RequestMapping(value = "snapshot", method = RequestMethod.GET)
	public String snapshot() {
		return "snapshot";
	}
}
