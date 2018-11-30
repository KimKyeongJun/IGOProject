package com.ktds.transport.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ktds.transport.dao.TransportDao;

@Component
public class TransportBizImpl implements TransportBiz {
	
	@Autowired
	private TransportDao transportDao;

}
