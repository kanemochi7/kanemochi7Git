package com.project.kanemochi.dao;

import java.util.ArrayList;

import com.project.kanemochi.vo.BudgetVO;
import com.project.kanemochi.vo.CountOneVO;
import com.project.kanemochi.vo.CountVO;
import com.project.kanemochi.vo.DateCategoryVO;
import com.project.kanemochi.vo.LimitVO;
import com.project.kanemochi.vo.RecordVO;
import com.project.kanemochi.vo.ShopVO;

public interface RecordDAO {
	public void input(RecordVO vo);
	public void upcount(RecordVO vo);
	public void downcount(CountOneVO vo);
	public int getcount(CountOneVO vo);
	public CountVO getAllCount(String id);	
	public void setbudget(BudgetVO vo);
	public BudgetVO getbudget(String id);	
	public boolean setStatus(ShopVO vo);
	public ArrayList<ShopVO> getStatus(String id);
	public int getExpense(String id);
	public ArrayList<RecordVO> getEveryRecord(String id);
	public boolean deleteStatus(ShopVO vo);
	public ArrayList<BudgetVO> budgetList(String id);
	public int avgCost(String id);
	public ArrayList<RecordVO> getSelectDateRecord(DateCategoryVO vo);
	public void insertbudget(String id);
	public void setbudget_limit(LimitVO vo);
	public LimitVO getbudget_limit(String id);
	public LimitVO checkGoal(LimitVO result);
	public String getCategory(String id);
	public void upGoal(String id);
}
