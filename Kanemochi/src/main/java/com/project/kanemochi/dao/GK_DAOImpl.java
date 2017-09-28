package com.project.kanemochi.dao;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kanemochi.vo.RecordVO;

import oracle.net.aso.h;



@Repository
public class GK_DAOImpl implements GK_DAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public ArrayList<RecordVO> getRecord(String id) {
		GKMapper mapper = sqlsession.getMapper(GKMapper.class);
		return mapper.getRecord(id);
	}

	@Override
	public ArrayList<RecordVO> getDayRecord(String id, String date) {
		GKMapper mapper = sqlsession.getMapper(GKMapper.class);
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("date", date);
		return mapper.getDayRecord(map);
	}

	@Override
	public ArrayList<RecordVO> getMonthRecord(String id, String searchMonth) {
		GKMapper mapper = sqlsession.getMapper(GKMapper.class);
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("month", searchMonth);
		return mapper.getMonthRecord(map);
	}

	@Override
	public ArrayList<RecordVO> getChartInfo(String date,String id) {
		GKMapper mapper = sqlsession.getMapper(GKMapper.class);
		Map<String, String> map = new HashMap<>();
		System.out.println(date);
		map.put("id", id);
		map.put("date", date.substring(0,7));
		return mapper.getChartInfo(map);
	}

	
}
