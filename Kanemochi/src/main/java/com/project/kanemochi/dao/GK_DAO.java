package com.project.kanemochi.dao;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.project.kanemochi.vo.RecordVO;


public interface GK_DAO {
	public ArrayList<RecordVO> getRecord(String id);	
	public ArrayList<RecordVO> getDayRecord(String id,String date);
	public ArrayList<RecordVO> getMonthRecord(String id,String searchMonth);
	public ArrayList<RecordVO> getChartInfo(String date,String id);

}
