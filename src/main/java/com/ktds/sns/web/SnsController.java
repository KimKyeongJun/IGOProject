package com.ktds.sns.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SnsController {
	
	@GetMapping("/sns/search")
	public ModelAndView viewSnsSearchPage(@RequestParam String searchKeyword) {
		ModelAndView view = new ModelAndView("sns/search");
		view.addObject("searchKeyword", searchKeyword);
		return view;
	}

}
