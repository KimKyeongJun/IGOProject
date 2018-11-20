package com.ktds.favorite.vo;

public class FavoriteVO {

	private String favoriteId;
	private String email;
	private String busId;
	private String subLine;

	public String getFavoriteId() {
		return favoriteId;
	}

	public void setFavoriteId(String favoriteId) {
		this.favoriteId = favoriteId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBusId() {
		return busId;
	}

	public void setBusId(String busId) {
		this.busId = busId;
	}

	public String getSubLine() {
		return subLine;
	}

	public void setSubLine(String subLine) {
		this.subLine = subLine;
	}

	@Override
	public String toString() {
		return "FavoriteVO [favoriteId=" + favoriteId + ", email=" + email + ", busId=" + busId + ", subLine=" + subLine
				+ "]";
	}

}
