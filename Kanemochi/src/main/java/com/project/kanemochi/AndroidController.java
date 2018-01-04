package com.project.kanemochi;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.kanemochi.dao.AndroidDAO;
import com.project.kanemochi.dao.RecordDAO;
import com.project.kanemochi.vo.RecordVO;

@Controller
@RequestMapping("/android")
public class AndroidController {
	
	@Autowired
	private AndroidDAO dao;
	
	
	@ResponseBody
	@RequestMapping(value ="getCalendar", method = RequestMethod.POST)
	public ArrayList<RecordVO> jsontest(@RequestBody String data){
	String[] datas= data.split(",");
	String id = datas[0];
	String date = datas[1];
	System.out.println(id);
	System.out.println(date);
	RecordVO record = new RecordVO();
	record.setRecord_date(date);
	record.setUser_id(id);
	System.out.println(record);
	ArrayList<RecordVO> jsonText = dao.getCalendarData(record);
//	ArrayList<RecordVO> jsonText = new ArrayList<>();
//	jsonText.add(new RecordVO(1,"lee"));
		
	System.out.println(jsonText);
		return jsonText;
	}
}
