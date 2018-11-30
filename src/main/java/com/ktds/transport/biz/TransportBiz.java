package com.ktds.transport.biz;

import java.util.List;

import com.ktds.transport.vo.BusVO;
import com.ktds.transport.vo.SubwayVO;

public interface TransportBiz {

	public List<String> selectBusList();

	public List<String> selectSubwayList();
}
