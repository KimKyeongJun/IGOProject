package com.ktds.transport.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ktds.transport.dao.TransportDao;
import com.ktds.transport.vo.BusVO;
import com.ktds.transport.vo.SubwayVO;

@Component
public class TransportBizImpl implements TransportBiz {
	
	@Autowired
	private TransportDao transportDao;

	@Override
	public List<String> selectBusList() {
		return this.transportDao.selectBusList();
	}

	@Override
	public List<String> selectSubwayList() {
		return this.transportDao.selectSubwayList();
	}

}
