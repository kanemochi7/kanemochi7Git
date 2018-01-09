package com.project.kanemochi.dao;

import java.util.ArrayList;

import com.project.kanemochi.vo.BudgetVO;
import com.project.kanemochi.vo.CountOneVO;
import com.project.kanemochi.vo.CountVO;
import com.project.kanemochi.vo.DateCategoryVO;
import com.project.kanemochi.vo.LimitVO;
import com.project.kanemochi.vo.MemberVO;
import com.project.kanemochi.vo.RecordVO;
import com.project.kanemochi.vo.ShopVO;

public interface AndroidDAO {
	public ArrayList<RecordVO> getCalendarData(RecordVO record);
	public MemberVO login(MemberVO vo);
}
