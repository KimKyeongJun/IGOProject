package com.ktds.reply.vo;

import javax.validation.constraints.NotEmpty;

import com.ktds.member.vo.MemberVO;
import com.nhncorp.lucy.security.xss.XssFilter;

public class ReplyVO {

	private String replyId;
	@NotEmpty(message = "내용을 입력하세요.")
	private String content;
	private String email;
	private String regDate;
	private String qnaId;

	private MemberVO memberVO;

	private String token;

	public String getReplyId() {
		return replyId;
	}

	public void setReplyId(String replyId) {
		this.replyId = replyId;
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

	public String getQnaId() {
		return qnaId;
	}

	public void setQnaId(String qnaId) {
		this.qnaId = qnaId;
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

	@Override
	public String toString() {
		return "ReplyVO [replyId=" + replyId + ", content=" + content + ", email=" + email + ", regDate=" + regDate
				+ ", qnaId=" + qnaId + ", memberVO=" + memberVO + ", token=" + token + "]";
	}

}
