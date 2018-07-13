package com.hk.th.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.th.vo.BboardVo;

@Repository("BboardDao")
public class BboardDaoImpl implements BboardDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String ns = "Bboard.";
	
	@Override
	public int selectBboardCount() {
		
		int dbres = sqlSession.selectOne(ns+"selectBboardCount");
		return dbres;
	}

	@Override
	public List<BboardVo> selectBboardList() {
		
		List<BboardVo> dbres = sqlSession.selectList(ns+"selectBboardList");
		return dbres;
	}

}
