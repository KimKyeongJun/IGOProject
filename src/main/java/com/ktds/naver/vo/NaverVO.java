package com.ktds.naver.vo;

import java.util.List;

public class NaverVO {

	private String lastBuildDate; // 검색 결과를 생성한 시간
	private int total; // 검색 결과 문서의 총 개수
	private int start; // 검색 결과 문서 중, 문서의 시작점
	private int display; // 검색된 검색 결과의 개수
	private List<ArticleVO> items; // 개별 검색 결과/ title, originallink, link, description, pubDate를 포함

	public String getLastBuildDate() {
		return lastBuildDate;
	}

	public void setLastBuildDate(String lastBuildDate) {
		this.lastBuildDate = lastBuildDate;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
	}

	public List<ArticleVO> getItems() {
		return items;
	}

	public void setItems(List<ArticleVO> items) {
		this.items = items;
	}

	@Override
	public String toString() {
		return "NaverVO [lastBuildDate=" + lastBuildDate + ", total=" + total + ", start=" + start + ", display="
				+ display + ", items=" + items + "]";
	}

}
