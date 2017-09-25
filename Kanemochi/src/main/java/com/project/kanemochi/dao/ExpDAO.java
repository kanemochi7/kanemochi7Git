package com.project.kanemochi.dao;

import com.project.kanemochi.vo.ExpVO;

public interface ExpDAO {

	public int getExp(String id);
	public void upExp(ExpVO vo);
	public int login_times(String id);
	
}
