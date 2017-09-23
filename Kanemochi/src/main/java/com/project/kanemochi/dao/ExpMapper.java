package com.project.kanemochi.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.project.kanemochi.vo.BudgetVO;
import com.project.kanemochi.vo.CountOneVO;
import com.project.kanemochi.vo.CountVO;
import com.project.kanemochi.vo.RecordVO;
import com.project.kanemochi.vo.ShopVO;

public interface ExpMapper {

	public void upExp(@Param("exp") int exp, @Param("id") String id);
	public int login_days(String id);

	
}
