package com.ktds.twitter.vo;

public class TwitterVO {

	private String userId;
	private String date;
	private String text;

	public TwitterVO(String userId, String date, String text) {
		this.userId = userId;
		this.date = date;
		this.text = text;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		return "TwitterVO [userId=" + userId + ", date=" + date + ", text=" + text + "]";
	}

}
