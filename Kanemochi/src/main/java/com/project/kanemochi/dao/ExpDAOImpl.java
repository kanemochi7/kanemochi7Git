package com.project.kanemochi.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ExpDAOImpl implements ExpDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public void upExp(int exp, String id) {
		System.out.println("upEXP"+","+exp+","+id);
		ExpMapper mapper = sqlsession.getMapper(ExpMapper.class);
		int s = mapper.getScore(id);
		System.out.println(s);
		s += 90;
		System.out.println(s);
		mapper.upExp(s, id);
	}

	@Override
	public int login_days(String id) {
		ExpMapper mapper = sqlsession.getMapper(ExpMapper.class);
		return mapper.login_days(id);
	}

}
