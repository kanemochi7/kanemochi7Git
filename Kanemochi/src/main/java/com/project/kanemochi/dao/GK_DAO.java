package com.project.kanemochi.dao;


import java.util.ArrayList;

import com.project.kanemochi.vo.RecordVO;


public interface GK_DAO {
	public ArrayList<RecordVO> getRecord(String id);
	
	public ArrayList<RecordVO> getDayRecord(String id,String date);
}
