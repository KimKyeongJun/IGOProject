package com.ktds.transport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.transport.biz.TransportBiz;
import com.ktds.transport.vo.BusVO;
import com.ktds.transport.vo.SubwayVO;

@Service
public class TransportServiceImpl implements TransportService {

	@Autowired
	private TransportBiz transportBiz;

	@Override
	public List<String> readBusList() {
		return this.transportBiz.selectBusList();
	}

	@Override
	public List<String> readSubwayList() {
		return this.transportBiz.selectSubwayList();
	}
}
