package com.project.kanemochi;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import com.project.kanemochi.dao.RecordDAO;
import com.project.kanemochi.vo.BudgetVO;
import com.project.kanemochi.vo.CountOneVO;
import com.project.kanemochi.vo.CountVO;
import com.project.kanemochi.vo.RecordVO;
import com.project.kanemochi.vo.ShopVO;
@Controller
@RequestMapping("/record")
public class RecordController {
	
	@Autowired
	private RecordDAO dao;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(Model model) {
		return "mainPage";
	}

	@RequestMapping(value = "input", method = RequestMethod.POST)
	@ResponseBody
	public CountOneVO input(RecordVO vo, HttpSession session) {
		/* 0. 일어->영어로 변환 & 세션에서 loginID 가져오기 => set */
		String category = change(vo.getCategory());
		String id = (String)session.getAttribute("loginID");
		vo.setUser_id(id);
		vo.setCategory(category);
		/* 1. record 입력 */
		dao.input(vo);
		/* 2. count 올리기 */
		dao.upcount(vo);
		/* 3. 변경된 count get & set */
		CountOneVO countvo = new CountOneVO(id, category, 0);
		countvo.setCount(dao.getcount(countvo));
		/* 4. 변경된 category, count 보내기 */
		return countvo;
	}
	
	@RequestMapping(value = "downcount", method = RequestMethod.POST)
	@ResponseBody
	public CountOneVO downcount(String category, HttpSession session) {
		/* 0. 세션에서 loginID 가져오기 => set */
		String id = (String)session.getAttribute("loginID");
		CountOneVO vo = new CountOneVO(id, category, 0);
		/* 1. count down */
		dao.downcount(vo);
		/* 2. 변경된 count get & set */
		vo.setCount(dao.getcount(vo));
		return vo;
	}
	
	public String change(String category_kanji) {
		String category_English="";
		switch (category_kanji) {
		case "バーがー":
			category_English = "burger";
			break;
		case "ラーメン":
			category_English = "ramen";
			break;
		case "すし":
			category_English = "sushi";
			break;
		case "カフェ":
			category_English = "cafe";
			break;
		case "デザート":
			category_English = "dessert";
			break;
		case "ビール":
			category_English = "beer";
			break;
		case "コンビニ":
			category_English = "cvs";
			break;
		case "映画":
			category_English = "movie";
			break;
		case "服":
			category_English = "clothes";
			break;
		case "美容室":
			category_English = "hair";
			break;
		case "病院":
			category_English = "hospital";
			break;
		/*case "薬局":
			category_English = "hospital";
			break;
		case "学院":
			category_English = "book";
			break;*/
		case "本":
			category_English = "book";
			break;
		case "バス":
			category_English = "bus";
			break;
		/*case "地下鉄":
			category_English = "bus";
			break;*/
		default:
			break;
		}
		return category_English;
	}
	@RequestMapping(value = "setStatus", method = RequestMethod.POST)
	@ResponseBody
	public boolean setStatus(BigDecimal img_x, BigDecimal img_y,String img_id , HttpSession session) {
		boolean result = false;
		System.out.println(img_x);
		System.out.println(img_y);
		System.out.println(img_id);
		String id = (String)session.getAttribute("loginID");
		System.out.println(id);
		ShopVO vo = new ShopVO(id, img_x,img_y,img_id);
		result = dao.setStatus(vo);
		return result;
	}
	
	@RequestMapping(value = "getStatus", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<ShopVO> getStatus(HttpSession session) {
		ArrayList<ShopVO> list = null;
		String id = (String)session.getAttribute("loginID");
		System.out.println(id);
		list = dao.getStatus(id);
		return list;
	}
	@RequestMapping(value = "getAllCount", method = RequestMethod.GET)
	@ResponseBody
	public CountVO getAllCount(HttpSession session){
		String id = (String)session.getAttribute("loginID");
		return dao.getAllCount(id);
	}
	
	@RequestMapping(value = "calendar", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<HashMap<String, Object>> calenderAjax(HttpServletRequest request,ModelMap modelMap) {
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
	
	@RequestMapping(value = "reportForm", method = RequestMethod.GET)
	public String reportForm() {
		return "reportForm";
	}
	
	@RequestMapping(value = "setbudget", method = RequestMethod.POST)
	@ResponseBody
	public void setbudget(BudgetVO vo, HttpSession session) {
		String id = (String)session.getAttribute("loginID");
		vo.setUser_id(id);
		dao.setbudget(vo);
	}

	@RequestMapping(value = "getbudget", method = RequestMethod.GET)
	@ResponseBody
	public BudgetVO getbudget(HttpSession session){
		String id = (String)session.getAttribute("loginID");
		return dao.getbudget(id);
	}
}
