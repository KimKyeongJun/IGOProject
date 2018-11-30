package com.ktds.transport.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.transport.biz.TransportBiz;

@Service
public class TransportServiceImpl implements TransportService {

	@Autowired
	private TransportBiz transportBiz;
}
