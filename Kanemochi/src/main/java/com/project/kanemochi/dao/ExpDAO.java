package com.project.kanemochi.dao;

import com.project.kanemochi.vo.ExpVO;

public interface ExpDAO {

	public void upExp(ExpVO vo);
	public int login_days(String id);
	
}
