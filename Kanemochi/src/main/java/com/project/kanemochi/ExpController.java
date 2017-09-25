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
	
	@RequestMapping(value = "getExp", method = RequestMethod.GET)
	@ResponseBody
	public int getExp(HttpSession session) {
		String id = (String)session.getAttribute("loginID");
		return dao.getExp(id);
	}
	
	@RequestMapping(value = "upExp", method = RequestMethod.GET)
	@ResponseBody
	public void upExp(int exp, HttpSession session) {
		System.out.println("upExp");
		System.out.println(exp);
		String id = (String)session.getAttribute("loginID");
		int expsum = dao.getExp(id)+exp;
		dao.upExp(new ExpVO(id, expsum));
	}

	@RequestMapping(value = "login_times", method = RequestMethod.GET)
	@ResponseBody
	public int login_times(HttpSession session) {
		String id = (String)session.getAttribute("loginID");
		return dao.login_times(id);
	}

}
