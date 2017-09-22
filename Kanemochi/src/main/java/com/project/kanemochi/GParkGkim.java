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

import com.project.kanemochi.dao.GPGK_DAO;

@Controller
public class GParkGkim {
	
	@Autowired
	private GPGK_DAO dao;
	
	@RequestMapping(value = "ajax.do", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<HashMap<String, Object>> calendarAjax(HttpServletRequest request,ModelMap modelMap) {
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
		list.add(resultMap1);
	
		return list;
	}

}
