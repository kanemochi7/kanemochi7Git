package com.project.kanemochi;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "loginForm";
	}
	
	
	@RequestMapping(value = "test", method = RequestMethod.GET)
	public String calender() {
		return "calenderTest";
	}
	
	@RequestMapping(value = "ajax.do", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<HashMap<String, Object>> calenderAjax(HttpServletRequest request,
									ModelMap modelMap) {
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
