package com.project.kanemochi.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kanemochi.vo.ScreenshotVO;

@Repository
public class GP_DAOImpl implements GP_DAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public int screenshotSave(ScreenshotVO vo) {
		GPMapper mapper = sqlsession.getMapper(GPMapper.class);
		int result = mapper.screenshotSave(vo);
		return result;
	}


	
	
}
