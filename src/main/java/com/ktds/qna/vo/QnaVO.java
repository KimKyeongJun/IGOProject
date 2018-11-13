package com.ktds.qna.vo;

import com.ktds.member.vo.MemberVO;
import com.nhncorp.lucy.security.xss.XssFilter;

public class QnaVO {

	private int rnum;
	private String qnaId;
	private String title;
	private String content;
	private String regDate;
	private String email;

	private MemberVO memberVO;

	private String token;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getQnaId() {
		return qnaId;
	}

	public void setQnaId(String qnaId) {
		this.qnaId = qnaId;
	}

	public String getTitle() {
		XssFilter filter = XssFilter.getInstance("lucy-xss-superset.xml");
		return filter.doFilter(title);
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		XssFilter filter = XssFilter.getInstance("lucy-xss-superset.xml");
		return filter.doFilter(content);
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

}
