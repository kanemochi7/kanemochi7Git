package com.project.kanemochi.dao;

import java.util.ArrayList;

import com.project.kanemochi.vo.BudgetVO;
import com.project.kanemochi.vo.CountOneVO;
import com.project.kanemochi.vo.CountVO;
import com.project.kanemochi.vo.RecordVO;
import com.project.kanemochi.vo.ShopVO;

public interface ExpDAO {

	public int login_days(String id);

	public void upExp(int exp, String id);
	
}
