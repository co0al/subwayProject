package com.hk.th.dao;

import java.util.ArrayList;
import java.util.List;

import com.hk.th.vo.BboardVo;

public interface BboardDao {
	
	public int selectBboardCount();

	public List<BboardVo> selectBboardList();

}
