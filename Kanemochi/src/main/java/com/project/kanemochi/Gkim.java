package com.project.kanemochi;



import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public ArrayList<HashMap<String, Object>> calendarAjax(String id) {
		ArrayList<RecordVO> allRecord = dao.getRecord(id);
		ArrayList<HashMap<String, Object>> result = new ArrayList<>();
		for (RecordVO recordVO : allRecord) {
			HashMap<String,Object> resultMap = new HashMap<>();
			resultMap.put("title", recordVO.getCategory());
			resultMap.put("start", recordVO.getRecord_date());
			resultMap.put("url", "/kanemochi/getOneRecord?id="+recordVO.getUser_id()+"&date="+recordVO.getRecord_date());
			result.add(resultMap);
		}
		/*
		HashMap<String,Object> resultMap = new HashMap<>();
		resultMap.put("id", 999);
		resultMap.put("title", "데헷!");
		resultMap.put("start", "2017-09-14");
		
		HashMap<String,Object> resultMap1 = new HashMap<>();
		resultMap1.put("id", 999);
		resultMap1.put("title", "데헷111!");
		resultMap1.put("start", "2017-09-16");
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		list.add(resultMap);
		list.add(resultMap1);*/
	
		return result;
	}
	
	@RequestMapping(value = "ajax2.do", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<RecordVO> getDayRecord(String id,String date){
		ArrayList<RecordVO> dayRecord = dao.getDayRecord(id, date);
		return dayRecord;
	}

}
