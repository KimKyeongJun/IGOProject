package com.ktds.favorite.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ktds.favorite.service.FavoriteService;

@Controller
public class FavoriteController {
	
	@Autowired
	private FavoriteService favoriteService;

}
