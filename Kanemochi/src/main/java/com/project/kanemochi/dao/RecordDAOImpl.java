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
	public int getcount(CountOneVO vo) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		return mapper.getcount(vo);
	}

	@Override
	public CountVO getAllCount(String id) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		return mapper.getAllCount(id);
	}

	@Override
	public void setbudget(BudgetVO vo) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);	
		mapper.setbudget(vo);
	}
	
	@Override
	public BudgetVO getbudget(String id) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		return mapper.getbudget(id);
	}

	@Override
	public boolean setStatus(ShopVO vo) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		mapper.setStatus(vo);
		return true;
	}

	@Override
	public ArrayList<ShopVO> getStatus(String id) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		ArrayList<ShopVO> result = mapper.getStatus(id);
		return result;
	}

	@Override
	public int getExpense(String id) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		int result = 0;
		if (mapper.getExpense(id) != null) {
			result = (int)mapper.getExpense(id);
		}
		return result;
	}

	@Override
	public ArrayList<RecordVO> getEveryRecord(String id) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		return mapper.getEveryRecord(id);
	}
}
