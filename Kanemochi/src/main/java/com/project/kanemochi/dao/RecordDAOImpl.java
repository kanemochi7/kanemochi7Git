package com.project.kanemochi.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kanemochi.vo.BudgetVO;
import com.project.kanemochi.vo.CountOneVO;
import com.project.kanemochi.vo.CountVO;
import com.project.kanemochi.vo.DateCategoryVO;
import com.project.kanemochi.vo.RecordVO;
import com.project.kanemochi.vo.ShopVO;
import com.project.kanemochi.vo.SumVO;

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
	public void insertbudget(String id) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		mapper.insertbudget(id);
	}
	
	@Override
	public void setbudget(BudgetVO vo) {
		System.out.println("to mapper:"+vo);
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
	public boolean deleteStatus(ShopVO vo) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		System.out.println(vo);
		boolean result = mapper.deleteStatus(vo);
		return result;
	}
	
	@Override
	public int getExpense(String id) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		int result = 0;
		SumVO vo = mapper.getExpense(id);
		if(vo != null) {
			result = vo.getSum();
		}
		return result;
	}
	
	@Override
	public ArrayList<RecordVO> getEveryRecord(String id) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		return mapper.getEveryRecord(id);
	}

	@Override
	public ArrayList<BudgetVO> budgetList(String id) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		return mapper.budgetList(id);
	}

	@Override
	public int avgCost(String id) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		return mapper.avgCost(id);
	}

	@Override
	public ArrayList<RecordVO> getSelectDateRecord(DateCategoryVO vo) {
		RecordMapper mapper = sqlsession.getMapper(RecordMapper.class);
		return mapper.getSelectDateRecord(vo);
	}


	
}
