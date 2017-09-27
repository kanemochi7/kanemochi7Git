package com.project.kanemochi.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kanemochi.vo.ExpVO;
import com.project.kanemochi.vo.MemberVO;


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
		mapper.upExp(vo);
	}

	@Override
	public int login_times(String id) {
		ExpMapper mapper = sqlsession.getMapper(ExpMapper.class);
		return mapper.login_times(id);
	}

	@Override
	public void setNewLevel(MemberVO vo) {
		ExpMapper mapper = sqlsession.getMapper(ExpMapper.class);
		mapper.setNewLevel(vo);
	}

}
