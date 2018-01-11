package com.project.kanemochi;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.kanemochi.dao.AndroidDAO;
import com.project.kanemochi.dao.RecordDAO;
import com.project.kanemochi.vo.MemberVO;
import com.project.kanemochi.vo.RecordVO;

@Controller
@RequestMapping("/android")
public class AndroidController {
	
	@Autowired
	private AndroidDAO dao;
	
	@ResponseBody
	@RequestMapping(value ="login", method = RequestMethod.POST,produces="application/json;charset=utf-8")
	public ArrayList<MemberVO> login(@RequestBody String data){
		
		String tempString = data.replace("%2C", ",");
		tempString = tempString.replace("=", "");
		System.out.println("temp:"+tempString);
		
		String[] datas= tempString.split(",");
		String id = datas[0];
		System.out.println("id: "+id);
		String pwd = datas[1];
		System.out.println(pwd);
		
		MemberVO memberVO = new MemberVO();
		memberVO.setUser_id(id);
		memberVO.setUser_pw(pwd);
		MemberVO result =dao.login(memberVO);
		if(result!=null){
			ArrayList<MemberVO> jsonResult = new ArrayList<>();
			jsonResult.add(result);
			return jsonResult;
		}
		return null;	
	}
	
	
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
	
	@ResponseBody
	@RequestMapping(value ="insertHouse", method = RequestMethod.POST,produces="application/json;charset=utf-8")
	public String insertTest(@RequestBody String data){
		
		String tempString = data.replace("%2C", ",");
		tempString = tempString.replace("=", "");
		System.out.println("housekeep:"+tempString);
		
		String[] datas= tempString.split(",");
		String id = datas[0];
		System.out.println(id);
		String day = datas[1];
		System.out.println(day);
		String category = datas[2];
		System.out.println(category);
		String tag = datas[3];
		System.out.println(tag);
		int kane = Integer.parseInt(datas[4]);
		System.out.println(kane);
		String payment = datas[5];
		System.out.println(payment);

		
		RecordVO recordVO = new RecordVO();
		recordVO.setUser_id(id);
		recordVO.setRecord_date(day);
		recordVO.setCategory(category);
		recordVO.setRecord_tag(tag);
		recordVO.setRecord_price(kane);
		recordVO.setRecord_pay(payment);
		int result = dao.insertHouse(recordVO);
		String resultString = String.valueOf(result);
		System.out.println(result);
		return resultString;
	}
	
	@ResponseBody
	@RequestMapping(value ="signUp", method = RequestMethod.POST,produces="application/json;charset=utf-8")
	public String signUp(@RequestBody String data){
		
		String tempString = data.replace("%2C", ",");
		tempString = tempString.replace("=", "");
		System.out.println("user:"+tempString);
		
		String[] datas= tempString.split(",");
		String id = datas[0];
		System.out.println(id);
		String pwd = datas[1];
		System.out.println(pwd);
		String name = datas[2];
		System.out.println(name);
		String email = datas[3];
		System.out.println(email);
		String tel = datas[4];
		System.out.println(tel);
		String category = datas[5];
		System.out.println(category);
		String gender = datas[6];
		System.out.println(gender);

		
		MemberVO memberVO = new MemberVO();
		memberVO.setImg_id(category);
		memberVO.setUser_email(email);
		memberVO.setUser_gender(gender);
		memberVO.setUser_id(id);
		memberVO.setUser_name(name);
		memberVO.setUser_phone(tel);
		memberVO.setUser_pw(pwd);
		int result = dao.signUp(memberVO);
		String resultString = String.valueOf(result);
		System.out.println(result);
		return resultString;
	}
}
