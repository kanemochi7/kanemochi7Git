package com.project.kanemochi.dao;

import com.project.kanemochi.vo.ExpVO;
import com.project.kanemochi.vo.MemberVO;

public interface ExpMapper {

	public int getExp(String id);
	public void upExp(ExpVO vo);
	public int login_times(String id);
	public void setNewLevel(MemberVO vo);

}
