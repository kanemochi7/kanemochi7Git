package com.project.kanemochi.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kanemochi.vo.ScreenshotVO;

@Repository
public class GP_DAOImpl implements GP_DAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public void saveScreenshot(ScreenshotVO scVO) {
		System.out.println(scVO);
		GPMapper mapper = sqlsession.getMapper(GPMapper.class);
		mapper.saveScreenshot(scVO);
	}

/*	@Override
	public ScreenshotVO printScreenshot() {
		GPMapper mapper = sqlsession.getMapper(GPMapper.class);
		ScreenshotVO printVO = mapper.printScreenshot();
		return printVO;
	}*/

	@Override
	public ArrayList<ScreenshotVO> printScreenshotAll(String user_id) {
		GPMapper mapper = sqlsession.getMapper(GPMapper.class);
		ArrayList<ScreenshotVO> screenshotList = mapper.printScreenshotAll(user_id);
		return screenshotList;
	}
	
}
