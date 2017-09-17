package com.project.kanemochi.dao;

import java.util.ArrayList;
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
	public MemberVO login(MemberVO vo) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.login(vo);
	}

	@Override
	public MemberVO checkId(String id) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.checkId(id);
	}

	@Override
	public ArrayList<MemberVO> memberList() {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.memberList();
	}

	@Override
	public MemberVO findPw(MemberVO vo) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.findPw(vo);
	}

	@Override
	public MemberVO findId(MemberVO vo) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.findId(vo);
	}

	@Override
	public MemberVO checkEmail(String user_email) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.checkEmail(user_email);
	}

	@Override
	public MemberVO getMember(String id) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.getMember(id);
	}

	@Override
	public int updateMember(MemberVO vo) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.updateMember(vo);
	}

	@Override
	public int deleteMember(String user_id) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.deleteMember(user_id);
	}

}
