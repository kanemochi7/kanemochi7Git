package com.project.kanemochi.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kanemochi.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public int signUp(MemberVO vo) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.signUp(vo);
	}

	@Override
	public int charUpdate(Map<String, String> map) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.charUpdate(map);
	}

	@Override
	public MemberVO login(MemberVO vo) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.login(vo);
	}

	@Override
	public MemberVO checkId(String id) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.checkId(id);
	}

}
