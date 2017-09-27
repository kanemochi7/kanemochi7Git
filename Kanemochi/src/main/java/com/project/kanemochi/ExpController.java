package com.project.kanemochi;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.kanemochi.dao.ExpDAO;
import com.project.kanemochi.vo.ExpVO;
import com.project.kanemochi.vo.MemberVO;

@Controller
@RequestMapping("/exp")
public class ExpController {
	
	@Autowired
	private ExpDAO dao;
	
	@RequestMapping(value = "getExp", method = RequestMethod.GET)
	@ResponseBody
	public int getExp(HttpSession session) {
		String id = (String)session.getAttribute("loginID");
		return dao.getExp(id);
	}
	
	@RequestMapping(value = "upExp", method = RequestMethod.GET)
	@ResponseBody
	public void upExp(int exp, int user_score, HttpSession session) {
		String id = (String)session.getAttribute("loginID");
		String newLevel = level(user_score);
		
		//user level 설정
		MemberVO mvo = new MemberVO();
		mvo.setUser_id(id);
		mvo.setLevel_title(newLevel);
		dao.setNewLevel(mvo);
		
		int expsum = dao.getExp(id)+exp;
		dao.upExp(new ExpVO(id, expsum));
	}

	@RequestMapping(value = "login_times", method = RequestMethod.GET)
	@ResponseBody
	public int login_times(HttpSession session) {
		String id = (String)session.getAttribute("loginID");
		return dao.login_times(id);
	}
	
	public String level(int user_score) {
		String level_title = "";
		if (user_score < 300) {
			level_title="1";
		} else if (user_score < 700) {
			level_title="2";
		} else if (user_score < 1240) {
			level_title="3";
		} else if (user_score < 2000) {
			level_title="4";
		} else if (user_score < 3120) {
			level_title="5";
		} else if (user_score < 4620) {
			level_title="6";
		} else if (user_score < 6600) {
			level_title="7";
		} else if (user_score < 9000) {
			level_title="8";
		} else if (user_score < 12000) {
			level_title="9";
		} else if (user_score > 12000) {
			level_title="10";
		}
		return level_title;
	}

}
