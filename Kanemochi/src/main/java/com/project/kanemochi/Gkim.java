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
			resultMap.put("id", recordVO.getRecord_num());
			resultMap.put("title", recordVO.getCategory());
			resultMap.put("start", recordVO.getRecord_date());
			result.add(resultMap);
		}
		return result;
	}
	
	@RequestMapping(value = "getDayRecord", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<RecordVO> getDayRecord(String date,HttpSession session){
		String id = (String) session.getAttribute("loginID");
		ArrayList<RecordVO> dayRecord = dao.getDayRecord(id, date);
		return dayRecord;
	}
	
	@RequestMapping(value = "getMonthRecord", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<RecordVO> getMonthRecord(String month,String year,HttpSession session){
		String id = (String) session.getAttribute("loginID");
		String searchMonth = null;
		switch (month) {		
			case "January":
				searchMonth = year+"-01";
				break;
				
			case "February":
				searchMonth = year+"-02";
				break;
				
			case "March":
				searchMonth = year+"-03";
				break;
				
			case "April":
				searchMonth = year+"-04";
				break;
				
			case "May":
				searchMonth = year+"-05";
				break;
				
			case "June":
				searchMonth = year+"-06";
				break;
				
			case "July":
				searchMonth = year+"-07";
				break;
				
			case "August":
				searchMonth = year+"-08";
				break;
				
			case "September":
				searchMonth = year+"-09";
				break;
				
			case "October":
				searchMonth = year+"-10";
				break;
				
			case "November":
				searchMonth = year+"-11";
				break;
				
			case "December":
				searchMonth = year+"-12";
				break;
				
			default:
				System.out.println("switch case ERROR: "+month);
				break;
		}
		ArrayList<RecordVO> monthRecord = dao.getMonthRecord(id,searchMonth);
		return monthRecord;
	}

}
