package com.project.kanemochi;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.kanemochi.dao.GP_DAO;
import com.project.kanemochi.vo.ScreenshotVO;


@Controller
public class GPark {
	@Autowired
	private GP_DAO dao;
	
	@RequestMapping(value = "screenshotSave", method = RequestMethod.GET)
	@ResponseBody
	public String screenshotSave(ScreenshotVO vo, Model model, HttpSession session) {
		String loginID = (String) session.getAttribute("loginID");
		vo.setUser_id(loginID);
		int result = dao.screenshotSave(vo);
		System.out.println(result);
		model.addAttribute("saveResult", result);
		return "album";
	}
}
