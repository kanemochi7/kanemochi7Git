package com.project.kanemochi;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.kanemochi.dao.ExpDAO;
import com.project.kanemochi.vo.BudgetVO;
import com.project.kanemochi.vo.CountOneVO;
import com.project.kanemochi.vo.CountVO;
import com.project.kanemochi.vo.RecordVO;
import com.project.kanemochi.vo.ShopVO;
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
		if (login_days == 10) {
			//login 10회 경험치 100xp
			upExp(login_days, id);
		}
		return login_days;
	}

	public void upExp(int exp, String id) {
		dao.upExp(exp, id);
	}

}
