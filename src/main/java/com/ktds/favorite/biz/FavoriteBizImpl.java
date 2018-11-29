package com.ktds.favorite.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ktds.favorite.dao.FavoriteDao;

@Component
public class FavoriteBizImpl implements FavoriteBiz {
	
	@Autowired
	private FavoriteDao favoriteDao;

}
