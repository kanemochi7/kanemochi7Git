package com.project.kanemochi.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kanemochi.vo.BudgetVO;
import com.project.kanemochi.vo.CountOneVO;
import com.project.kanemochi.vo.CountVO;
import com.project.kanemochi.vo.DateCategoryVO;
import com.project.kanemochi.vo.LimitVO;
import com.project.kanemochi.vo.MemberVO;
import com.project.kanemochi.vo.RecordVO;
import com.project.kanemochi.vo.ShopVO;
import com.project.kanemochi.vo.SumVO;

@Repository
public class AndroidDAOImpl implements AndroidDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public ArrayList<RecordVO> getCalendarData(RecordVO record) {
		// TODO Auto-generated method stub
		AndroidMapper mapper = sqlsession.getMapper(AndroidMapper.class);
		System.out.println(record.getRecord_date());
		System.out.println(record.getUser_id());
		return mapper.getCalendarData(record);
	}

	@Override
	public MemberVO login(MemberVO vo) {
		AndroidMapper mapper = sqlsession.getMapper(AndroidMapper.class);
		return mapper.login(vo);
	}

	

	
}
