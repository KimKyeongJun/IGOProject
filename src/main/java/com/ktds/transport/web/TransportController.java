package com.ktds.transport.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.transport.service.TransportService;

@Controller
public class TransportController {
	
	@Autowired
	private TransportService transportService;

	@GetMapping("/transport/read")
	@ResponseBody
	public Map<String, List> doGetTransportDataAction() {
		List<String> busList = this.transportService.readBusList();
		List<String> subwayList = this.transportService.readSubwayList();
		
		Map<String, List> result = new HashMap<>();
		result.put("Subway", subwayList);
		result.put("Bus", busList);
		
		return result;
	}
}
