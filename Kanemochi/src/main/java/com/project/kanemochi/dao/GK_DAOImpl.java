package com.project.kanemochi.dao;



import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kanemochi.vo.RecordVO;



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
		return mapper.getDayRecord(id, date);
	}

	
}
