package com.project.kanemochi.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kanemochi.vo.CountOneVO;
import com.project.kanemochi.vo.RecordVO;

@Repository
public class RecordDAOImpl implements RecordDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public void input(RecordVO vo) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		mapper.input(vo);
	}

	@Override
	public void upcount(RecordVO vo) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		mapper.upcount(vo);
	}
	
	@Override
	public void downcount(CountOneVO vo) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		mapper.downcount(vo);
	}

	@Override
	public int getcount(RecordVO vo) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		return mapper.getcount(vo);
	}

}
