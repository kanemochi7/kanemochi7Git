package com.project.kanemochi;

import java.math.BigDecimal;
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

import com.project.kanemochi.dao.RecordDAO;
import com.project.kanemochi.vo.BudgetVO;
import com.project.kanemochi.vo.CountOneVO;
import com.project.kanemochi.vo.CountVO;
import com.project.kanemochi.vo.RecordVO;
import com.project.kanemochi.vo.ShopVO;

import net.sf.json.JSONArray;
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
		String category = change(vo.getCategory());
		String id = (String)session.getAttribute("loginID");
		vo.setUser_id(id);
		vo.setCategory(category);
		System.out.println(vo);
		dao.input(vo);
		dao.upcount(vo);
		CountOneVO countvo = new CountOneVO(id, category, 0);
		countvo.setCount(dao.getcount(countvo));
		return countvo;
	}
	
	@RequestMapping(value = "downcount", method = RequestMethod.POST)
	@ResponseBody
	public CountOneVO downcount(String category, HttpSession session) {
		String id = (String)session.getAttribute("loginID");
		CountOneVO vo = new CountOneVO(id, category, 0);
		dao.downcount(vo);
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
		case "銀行":
			category_English = "bank";
			break;
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
		list = dao.getStatus(id);
		return list;
	}
	
	@RequestMapping(value = "getAllCount", method = RequestMethod.GET)
	@ResponseBody
	public CountVO getAllCount(HttpSession session){
		String id = (String)session.getAttribute("loginID");
		return dao.getAllCount(id);
	}
	
	@RequestMapping(value = "reportForm", method = RequestMethod.GET)
	public String reportForm(Model model,HttpSession session) {
		String id = (String)session.getAttribute("loginID");
		ArrayList<RecordVO> list =dao.getEveryRecord(id);
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("everyList", jsonArray.fromObject(list));
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

	@RequestMapping(value = "getExpense", method = RequestMethod.GET)
	@ResponseBody
	public int getExpense(HttpSession session){
		String id = (String)session.getAttribute("loginID");
		return dao.getExpense(id);
	}
}
