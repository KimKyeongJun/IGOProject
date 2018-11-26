package com.ktds.sns.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SnsController {
	
	@GetMapping("/sns/search")
	public String viewSnsSearchPage(@RequestParam String searchKeyword) {
		return "sns/search";
	}

}
