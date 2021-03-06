package com.ktds.member.vo;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

import com.ktds.member.validator.MemberValidator;
import com.nhncorp.lucy.security.xss.XssFilter;


public class MemberVO {

	@NotEmpty(message="이메일은 필수 입력 값입니다.", groups= {MemberValidator.Login.class,MemberValidator.Regist.class})
	@Email(message="이메일 형식으로 작성해주세요.", groups= {MemberValidator.Login.class,MemberValidator.Regist.class})
	private String email;
	@NotEmpty(message="이름은 필수 입력 값입니다.", groups= {MemberValidator.Regist.class})
	private String name;
	@NotEmpty(message="비밀번호는 필수 입력 값입니다.", groups= {MemberValidator.Regist.class, MemberValidator.Login.class})
	@Length(min=8, max=20, groups= {MemberValidator.Regist.class})
	@Pattern(regexp="((?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()]).{8,})",message="비밀번호는 8글자 이상 대소문자, 숫자, 특수문자 조합으로 설정해야 합니다.",  groups = {MemberValidator.Regist.class})
	private String password;
	private String salt;
	private int loginFailCount;
	private String lastLogin;
	private String adminYN;
	private String approvalStatus;
	@NotEmpty(message="연락처는 필수 입력 값입니다.", groups= {MemberValidator.Regist.class})
	private String phone;
	
	XssFilter filter = XssFilter.getInstance("lucy-xss-superset.xml");
	public String getEmail() {
		return filter.doFilter(email);
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return filter.doFilter(name);
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public int getLoginFailCount() {
		return loginFailCount;
	}

	public void setLoginFailCount(int loginFailCount) {
		this.loginFailCount = loginFailCount;
	}

	public String getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}

	public String getAdminYN() {
		return adminYN;
	}

	public void setAdminYN(String adminYN) {
		this.adminYN = adminYN;
	}

	public String getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = filter.doFilter(phone);
	}

	@Override
	public String toString() {
		return "MemberVO [email=" + email + ", name=" + name + ", password=" + password + ", salt=" + salt
				+ ", loginFailCount=" + loginFailCount + ", lastLogin=" + lastLogin + ", adminYN=" + adminYN
				+ ", approvalStatus=" + approvalStatus + ", phone=" + phone + "]";
	}
}
