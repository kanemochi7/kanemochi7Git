package com.project.kanemochi.dao;

import com.project.kanemochi.vo.ExpVO;

public interface ExpMapper {

	public void upExp(ExpVO vo);
	public int getExp(String id);
	public int login_days(String id);

}
