package com.project.kanemochi.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kanemochi.vo.ExpVO;


@Repository
public class ExpDAOImpl implements ExpDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public void upExp(int exp, String id) {
		System.out.println("upEXP"+","+exp+","+id);
		ExpMapper mapper = sqlsession.getMapper(ExpMapper.class);
		ExpVO vo = new ExpVO(id, exp);
		mapper.upExp(vo);
	}

	@Override
	public int login_days(String id) {
		ExpMapper mapper = sqlsession.getMapper(ExpMapper.class);
		return mapper.login_days(id);
	}

}
