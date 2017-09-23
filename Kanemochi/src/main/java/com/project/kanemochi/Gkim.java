package com.project.kanemochi;



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

import com.project.kanemochi.dao.GK_DAO;
import com.project.kanemochi.vo.RecordVO;

@Controller
public class Gkim {
	
	@Autowired
	private GK_DAO dao;
	
	@RequestMapping(value = "ajax.do", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<HashMap<String, Object>> calendarAjax(HttpSession session) {
		String id = (String) session.getAttribute("loginID");
		ArrayList<RecordVO> allRecord = dao.getRecord(id);
		ArrayList<HashMap<String, Object>> result = new ArrayList<>();
		for (RecordVO recordVO : allRecord) {
			HashMap<String,Object> resultMap = new HashMap<>();
			resultMap.put("title", recordVO.getCategory());
			resultMap.put("start", recordVO.getRecord_date());
			System.out.println("time: "+recordVO.getRecord_date());
			resultMap.put("url", "/kanemochi/getOneRecord?id="+recordVO.getUser_id()+"&date="+recordVO.getRecord_date());
			result.add(resultMap);
		}
		return result;
	}
	
	@RequestMapping(value = "getOneRecord", method = RequestMethod.GET)
	public String getDayRecord(String id,String date,Model model){
		ArrayList<RecordVO> dayRecord = dao.getDayRecord(id, date);
		model.addAttribute("list", dayRecord);
		return "redirect:/kanemochi/ajax.do";
	}

}
