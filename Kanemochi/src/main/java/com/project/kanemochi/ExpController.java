package com.project.kanemochi;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.kanemochi.dao.ExpDAO;
import com.project.kanemochi.vo.ExpVO;

@Controller
@RequestMapping("/exp")
public class ExpController {
	
	@Autowired
	private ExpDAO dao;

	@RequestMapping(value = "login_days", method = RequestMethod.GET)
	@ResponseBody
	public int login_days(HttpSession session) {
		String id = (String)session.getAttribute("loginID");
		int login_days = dao.login_days(id);
		if (login_days == 9) {
			//login 9회 경험치 90xp
			int exp = 90;
			ExpVO vo = new ExpVO(id, exp);
			dao.upExp(vo);
			return login_days;
		}
		return login_days;
	}
	
	@RequestMapping(value = "getExp", method = RequestMethod.GET)
	@ResponseBody
	public int getExp(HttpSession session) {
		String id = (String)session.getAttribute("loginID");
		return dao.getExp(id);
	}


}
