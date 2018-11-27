package com.ktds.sns.vo;

public class SnsVO {

	private String id;
	private String url;
	private String text;
	private String date;
	
	public SnsVO(String id, String url, String text, String date) {
		this.id = id;
		this.url = url;
		this.text = text;
		this.date = date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "SnsVO [id=" + id + ", url=" + url + ", text=" + text + ", date=" + date + "]";
	}

}
