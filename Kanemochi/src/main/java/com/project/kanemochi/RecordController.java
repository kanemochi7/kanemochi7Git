package com.project.kanemochi;

import java.text.DateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.kanemochi.dao.RecordDAO;
import com.project.kanemochi.vo.CountOneVO;
import com.project.kanemochi.vo.RecordVO;

@Controller
@RequestMapping("/account")
public class RecordController {
	
	@Autowired
	private RecordDAO dao;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(Model model) {
		return "mainPage";
	}

	@RequestMapping(value = "input", method = RequestMethod.POST)
	@ResponseBody
	public CountOneVO input(RecordVO vo) {
		/* 1. record 입력*/
		dao.input(vo);
		/* 2. count 올리기 (id 일어->영어로 변환)*/
		String category = change(vo.getCategory());
		vo.setCategory(category);
		dao.upcount(vo);
		/* 3. 변경된 count 가져오기*/
		int count = dao.getcount(vo);
		/* 4. 변경된 category, count 보내기*/
		CountOneVO countVO = new CountOneVO(category, count);
		return countVO;
	}
	
	@RequestMapping(value = "downcount", method = RequestMethod.POST)
	@ResponseBody
	public CountOneVO downcount(String category) {
		System.out.println("downcount");
		System.out.println(category);
		/* 1. count 내리기 (id 일어->영어로 변환)*/
		CountOneVO countvo = new CountOneVO(category, 0);
		dao.downcount(countvo);
		/* 2. 변경된 count 가져오기*/
		RecordVO vo = new RecordVO();
		vo.setCategory(category);
		int count = dao.getcount(vo);
		/* 3. 변경된 category, count 보내기*/
		CountOneVO countVO = new CountOneVO(category, count);
		return countVO;
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
	
	
	
	
	

}
