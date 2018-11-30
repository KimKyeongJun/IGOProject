package com.ktds.transport.dao;

import java.util.List;

import com.ktds.transport.vo.BusVO;
import com.ktds.transport.vo.SubwayVO;

public interface TransportDao {
	
	public List<String> selectBusList();
	
	public List<String> selectSubwayList();

}
