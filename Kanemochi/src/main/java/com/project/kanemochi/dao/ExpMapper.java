package com.project.kanemochi.dao;

import org.apache.ibatis.annotations.Param;

public interface ExpMapper {

	public void upExp(@Param("exp") int exp, @Param("id") String id);
	public int getScore(String id);
	public int login_days(String id);

	
}
