package com.ktds.sns.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class SnsController {
	
	@GetMapping("/sns/search/{searchKeyword}")
	public String viewSnsSearchPage(@PathVariable String searchKeyword) {
		System.out.println("!!!!!!!SnsController" + searchKeyword);
		return "sns/search";
	}

}
