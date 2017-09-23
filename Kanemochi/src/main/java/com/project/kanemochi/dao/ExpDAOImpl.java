package com.project.kanemochi.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kanemochi.vo.BudgetVO;
import com.project.kanemochi.vo.CountOneVO;
import com.project.kanemochi.vo.CountVO;
import com.project.kanemochi.vo.RecordVO;
import com.project.kanemochi.vo.ShopVO;

@Repository
public class ExpDAOImpl implements ExpDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public void upExp(int exp, String id) {
		System.out.println("upEXP"+","+exp+","+id);
		ExpMapper mapper = sqlsession.getMapper(ExpMapper.class);
		mapper.upExp(exp, id);
	}

	@Override
	public int login_days(String id) {
		ExpMapper mapper = sqlsession.getMapper(ExpMapper.class);
		return mapper.login_days(id);
	}

}
