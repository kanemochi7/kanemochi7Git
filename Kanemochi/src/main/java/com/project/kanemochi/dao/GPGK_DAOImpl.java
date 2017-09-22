package com.project.kanemochi.dao;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class GPGK_DAOImpl implements GPGK_DAO {

	@Autowired
	private SqlSession sqlsession;

	
}
