package com.project.kanemochi.dao;

import java.util.ArrayList;
import java.util.Map;

import com.project.kanemochi.vo.RecordVO;


public interface GKMapper {
	
	public ArrayList<RecordVO> getRecord(String id);
	public ArrayList<RecordVO> getDayRecord(Map<String, String> map);
}
