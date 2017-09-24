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
	public int getExp(String id) {
		ExpMapper mapper = sqlsession.getMapper(ExpMapper.class);
		return mapper.getExp(id);
	}

	@Override
	public void upExp(ExpVO vo) {
		ExpMapper mapper = sqlsession.getMapper(ExpMapper.class);
		int exp1 = mapper.getExp(vo.getId());
		int exp2 = vo.getExp();
		int exp3 = exp1+exp2;
		vo.setExp(exp3);
		mapper.upExp(vo);
	}

	@Override
	public int login_days(String id) {
		ExpMapper mapper = sqlsession.getMapper(ExpMapper.class);
	return mapper.login_days(id);
	}

}
