package com.project.kanemochi.dao;



import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.kanemochi.vo.RecordVO;



@Repository
public class GP_DAOImpl implements GP_DAO {

	@Autowired
	private SqlSession sqlsession;


	
	
}
