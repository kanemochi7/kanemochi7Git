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
	
	@RequestMapping(value = "loginCheck", method = RequestMethod.POST)
	@ResponseBody
	public void loginCheck(HttpSession session) {
		String id = (String)session.getAttribute("loginID");
	}
	
}
