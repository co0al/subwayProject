package com.hk.th.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hk.th.dao.AaDao;

@Service("AaService")
public class AaServiceImpl implements AaService{

	@Resource(name="AaDao")
	private AaDao aaDao;
	
	@Override
	public int bboardTotalCount() {
		
		int svres = aaDao.selectBboardCount();
		return svres;
	}

}
