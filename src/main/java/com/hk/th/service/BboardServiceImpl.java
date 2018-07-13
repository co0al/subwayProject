package com.hk.th.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hk.th.dao.BboardDao;
import com.hk.th.vo.BboardVo;

@Service("BboardService")
public class BboardServiceImpl implements BboardService{

	@Resource(name="BboardDao")
	private BboardDao bbDao;
	
	@Override
	public int bboardTotalCount() {
		
		int svres = bbDao.selectBboardCount();
		return svres;
	}

	@Override
	public ArrayList<BboardVo> bboardList() {
		
		ArrayList<BboardVo> svres = null;
		
		svres = (ArrayList<BboardVo>)bbDao.selectBboardList();
		
		return svres;
	}

}
