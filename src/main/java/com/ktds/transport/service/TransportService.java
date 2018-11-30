package com.ktds.transport.service;

import java.util.List;

import com.ktds.transport.vo.BusVO;
import com.ktds.transport.vo.SubwayVO;

public interface TransportService {

	public List<String> readBusList();
	
	public List<String> readSubwayList();
}
