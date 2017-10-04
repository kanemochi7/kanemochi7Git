package com.project.kanemochi;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

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
import com.project.kanemochi.vo.BubbleVO;
import com.project.kanemochi.vo.BudgetVO;
import com.project.kanemochi.vo.CountOneVO;
import com.project.kanemochi.vo.CountVO;
import com.project.kanemochi.vo.DateCategoryVO;
import com.project.kanemochi.vo.LimitVO;
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
		dao.upGoal(id);
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
	@RequestMapping(value = "upcount", method = RequestMethod.POST)
	@ResponseBody
	public CountOneVO upcount(String category, HttpSession session) {
		RecordVO vo = new RecordVO();
		vo.setCategory(category);
		String id = (String)session.getAttribute("loginID");
		vo.setUser_id(id);
		dao.upcount(vo);
		CountOneVO countvo = new CountOneVO(id, category, 0);
		countvo.setCount(dao.getcount(countvo));
		return countvo;
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
	@RequestMapping(value = "deleteStatus", method = RequestMethod.POST)
	@ResponseBody
	public boolean deleteStatus(ShopVO vo, HttpSession session) {
		boolean result = false;
		String id = (String)session.getAttribute("loginID");
		System.out.println(id);
		vo.setUser_id(id);
		System.out.println(vo);
		result = dao.deleteStatus(vo);
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
		ArrayList<RecordVO> recordList = dao.getEveryRecord(id);
		int price_food = 0;
		int price_culture = 0;
		int price_fashion = 0;
		int price_itai = 0;
		int price_study = 0;
		int price_transportation = 0;
		int price_bank = 0;
		int price_others = 0;
		for (RecordVO recordVO : recordList) {
			String category = categoryFinder(recordVO.getCategory());
			switch (category) {
			case "食べ物":
				price_food += recordVO.getRecord_price();
				break;
			case "文化生活":
				price_culture += recordVO.getRecord_price();
				break;
			case "ファッション":				
				price_fashion += recordVO.getRecord_price();
				break;
			case "医慮":
				price_itai += recordVO.getRecord_price();
				break;
			case "教育":	
				price_study += recordVO.getRecord_price();
				break;
			case "交通":
				price_transportation += recordVO.getRecord_price();
				break;
			case "貯金":
				price_bank += recordVO.getRecord_price();
				break;

			default:
				price_others += recordVO.getRecord_price();
				break;
			}
		}
		
		ArrayList<BudgetVO> budgetList = dao.budgetList(id);
		int avgCost = dao.avgCost(id);
		int budget = 0;
		for (BudgetVO budgetVO : budgetList) {
			budget += budgetVO.getMonthly();
		}
		budget = budget/budgetList.size();
		
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("everyList", jsonArray.fromObject(recordList));
		model.addAttribute("avgBudget", budget);
		model.addAttribute("avgCost", avgCost);
		model.addAttribute("price_bank", price_bank);
		model.addAttribute("price_culture", price_culture);
		model.addAttribute("price_fashion", price_fashion);
		model.addAttribute("price_food", price_food);
		model.addAttribute("price_itai", price_itai);
		model.addAttribute("price_others", price_others);
		model.addAttribute("price_study", price_study);
		model.addAttribute("price_transportation", price_transportation);
		return "reportForm";
	}
	
	@RequestMapping(value = "setbudget", method = RequestMethod.POST)
	@ResponseBody
	public void setbudget(BudgetVO vo, HttpSession session) {
		String id = (String)session.getAttribute("loginID");
		if (dao.getbudget(id) == null) {
			dao.insertbudget(id);
		}
		vo.setUser_id(id);
		dao.setbudget(vo);
	}
	
	@RequestMapping(value = "setbudget_limit", method = RequestMethod.POST)
	@ResponseBody
	public void setbudget_limit(LimitVO vo, HttpSession session) {
		String id = (String)session.getAttribute("loginID");
		String category = change(vo.getCategory());
		vo.setCategory(category);
		vo.setId(id);
		System.out.println(vo);
		dao.setbudget_limit(vo);
	}
	
	@RequestMapping(value = "getbudget_limit", method = RequestMethod.GET)
	@ResponseBody
	public LimitVO getbudget_limit(HttpSession session) {
		String id = (String)session.getAttribute("loginID");
		LimitVO result = new LimitVO(id, "", "", 0, 0,0,0);
		LimitVO vo = dao.getbudget_limit(id);
		if(vo == null) {
			return result;
		} else {
			return vo;			
		}
	}
	
	@RequestMapping(value = "getbudget", method = RequestMethod.GET)
	@ResponseBody
	public BudgetVO getbudget(HttpSession session){
		String id = (String)session.getAttribute("loginID");
		BudgetVO result = new BudgetVO(0, id, 0, 0, 0);
		BudgetVO get = dao.getbudget(id);
		if (get != null) {
			result = get;
		}
		return result;
	}
	@RequestMapping(value = "checkGoal", method = RequestMethod.POST)
	@ResponseBody
	public LimitVO checkGoal(HttpSession session){
		String id = (String)session.getAttribute("loginID");
		LimitVO result = new LimitVO(id, "", "", 0, 0,0,0);
		String category = dao.getCategory(id);
		result.setCategory(category);
		LimitVO vo = dao.checkGoal(result);
		vo.setCategory(category);
		vo.setId(id);
		System.out.println(vo);
		if(vo == null) {
			return result;
		} else {
			return vo;			
		}
	}
	@RequestMapping(value = "getExpense", method = RequestMethod.GET)
	@ResponseBody
	public int getExpense(HttpSession session){
		String id = (String)session.getAttribute("loginID");
		return dao.getExpense(id);
	}
	
	@RequestMapping(value = "getSelectDateRecord", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<BubbleVO> getSelectDateRecord(HttpSession session, String start_date, String end_date, String category){
		String id = (String)session.getAttribute("loginID");
		DateCategoryVO vo = new DateCategoryVO(id, start_date, end_date, category);
		ArrayList<RecordVO> list = dao.getSelectDateRecord(vo);
		ArrayList<String> taglist = new ArrayList<>();

		
		for (int i = 0; i < list.size(); i++) {
			String MainCategory = categoryFinder(list.get(i).getCategory());
			if (MainCategory.equals(category)) { //사용한 카테고리에 해당하는 경우
				for (int j = 0; j < list.size(); j++) {
					String jstr = list.get(j).getRecord_tag().replace("#", "");
					String istr = list.get(i).getRecord_tag().replace("#", "");
					if (istr.equals(jstr)) { //일치하는 태그가 있는 경우
						taglist.add(istr);
					}
				}
			}
		}
		// HashSet 데이터 형태로 생성되면서 중복 제거됨
		HashSet<String> hs = new HashSet<String>(taglist);
		// ArrayList 형태로 다시 생성
		ArrayList<String> newtaglist = new ArrayList<String>(hs);

		ArrayList<BubbleVO> bubbleList = new ArrayList<>();		
		int visit = 0; //방문횟수
		int price = 0; //금액
		int avg = 0; //평균
		int sum = 0; //기간 총 금액
		
		for (int i = 0; i < newtaglist.size(); i++) {
			for (int j = 0; j < list.size(); j++) {
				if ((newtaglist.get(i)).equals(list.get(j).getRecord_tag().replace("#", ""))) {
					visit++;
					price += list.get(j).getRecord_price();
				}
			}
			if (visit!=0) {				
				BubbleVO bo = new BubbleVO();
				avg = price/visit;
				sum = avg*visit;
				bo.setTag(newtaglist.get(i));//태그
				bo.setVisit(visit);//방문
				bo.setAvg(avg);//평균금액
				bo.setSum(sum);//기간총금액
				bubbleList.add(bo);
			}
		}
System.out.println(bubbleList);
		return bubbleList;
		
	}
	
	private String categoryFinder(String category){
		String result = null;
		switch (category) {
		case "burger": case "ramen": case "sushi": case "cafe":
		case "dessert": case "beer": case "cvs":
			result = "食べ物"; 
			break;
		case "movie":
			result = "文化生活";
			break;
		case "clothes": case "hair":
			result = "ファッション";
			break;
		case "hospital": 
			result = "医慮";
			break;
		case "book":
			result = "教育";
			break;
		case "bus":
			result = "交通";
			break;
		case "bank":
			result = "貯金";
			break;
		default:
			result = "その他";
			break;
		}
		return result;
	}
}
