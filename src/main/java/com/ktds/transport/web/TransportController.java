package com.ktds.transport.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.transport.service.TransportService;

@Controller
public class TransportController {
	
	@Autowired
	private TransportService transportService;

	@GetMapping
	@ResponseBody
	public void doGetTransportDataAction() {
		
	}
}
