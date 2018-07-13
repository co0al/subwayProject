package com.hk.th.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("AaDao")
public class AaDaoImpl implements AaDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String ns = "Aa.";
	
	@Override
	public int selectBboardCount() {
		
		int dbres = sqlSession.selectOne(ns+"selectBboardCount");
		return dbres;
	}

}
