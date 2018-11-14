package com.ktds.approval.vo;

public class ApprovalVO {

	private String email;
	private String key;

	public ApprovalVO(String email, String key) {
		this.email = email;
		this.key = key;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	@Override
	public String toString() {
		return "ApprovalVO [email=" + email + ", key=" + key + "]";
	}

}
