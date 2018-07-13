package com.hk.th.service;

import java.util.ArrayList;

import com.hk.th.vo.BboardVo;

public interface BboardService {
	
	public int bboardTotalCount();

	public ArrayList<BboardVo> bboardList();

}
