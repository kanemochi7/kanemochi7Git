package com.project.kanemochi;

import java.util.ArrayList;

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
	
	@RequestMapping(value="saveScreenshot", method = RequestMethod.POST)
	@ResponseBody
	public String saveScreenshot(String imgData, HttpSession session){
		System.out.println("saveScreenshot function running......");
		if(imgData != null){
			System.out.println("base64 came....");
		}else{
			System.out.println("base64 not coming.....");
		}
		
		String user_id = (String) session.getAttribute("loginID");
		ScreenshotVO scVO = new ScreenshotVO();
		scVO.setScreenshotData(imgData); 
		scVO.setUser_id(user_id);
		dao.saveScreenshot(scVO);
		
		return "loginForm";
	}
	
/*	@RequestMapping(value = "printScreenshot")
	@ResponseBody
	public ScreenshotVO printScreenshot() {
		ScreenshotVO printVO = dao.printScreenshot();
		return printVO;
	}*/
	
/*	@RequestMapping(value = "printScreenshotAll")
	@ResponseBody
	public ArrayList<ScreenshotVO> printScreenshotAll(HttpSession session) {
		String user_id = (String) session.getAttribute("loginID");
		ArrayList<ScreenshotVO> screenshotList = dao.printScreenshotAll(user_id);
		return screenshotList;
	}*/
	
	@RequestMapping(value = "printScreenshotAll")
	public String printScreenshotAll(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("loginID");
		ArrayList<ScreenshotVO> scList = dao.printScreenshotAll(user_id);
		model.addAttribute("scList", scList);
		return "album3";
	}
	
/*	@RequestMapping(value = "/member/album", method = RequestMethod.GET)
	public String album() {
		return "printScreenshotAll2";
	}*/
	
	@RequestMapping(value = "deleteScreenshot", method = RequestMethod.GET)
	public void deleteScreenshot(ScreenshotVO vo, HttpSession session) {
		
	}
	
}
