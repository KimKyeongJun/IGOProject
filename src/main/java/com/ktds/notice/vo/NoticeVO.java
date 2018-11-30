package com.ktds.notice.vo;

import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

import com.ktds.member.vo.MemberVO;
import com.nhncorp.lucy.security.xss.XssFilter;

public class NoticeVO {

	private String noticeId;
	@NotEmpty(message = "제목은 필수 입력 값입니다.")
	private String title;
	@NotEmpty(message = "내용은 필수 입력 값입니다.")
	private String content;
	private String email;
	private String regDate;
    private String viewCount;
	private MemberVO memberVO;
	private String token;
    private int rnum;
    
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	public String getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getViewCount() {
		return viewCount;
	}

	public void setViewCount(String viewCount) {
		this.viewCount = viewCount;
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