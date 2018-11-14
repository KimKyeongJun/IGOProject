package com.ktds.member.service;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.approval.biz.ApprovalBiz;
import com.ktds.approval.vo.ApprovalVO;
import com.ktds.member.biz.MemberBiz;
import com.ktds.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberBiz memberBiz;
	
	@Autowired
	private ApprovalBiz approvalBiz;
	
	@Override
	public boolean registOneMember(MemberVO memberVO) {
		return memberBiz.registOneMember(memberVO);
	}
	
	@Override
	public MemberVO readOneMember(MemberVO memberVO) {
		return memberBiz.readOneMember(memberVO);
	}

	@Override
	public boolean readOneEmail(String email) {
		return memberBiz.readOneEmail(email);
	}

	@Override
	public boolean isBlockUser(String email) {
		return memberBiz.isBlockUser(email);
	}

	@Override
	public boolean setApprovalKey(ApprovalVO approvalVO) {
		try {
			send_mail(approvalVO);
		} catch (Exception e) {
		}
		return this.approvalBiz.insertApprovalKey(approvalVO) > 0;
	}
	
	// 이메일 발송
	public void send_mail(ApprovalVO approvalVO) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "igoproj@naver.com";
		String hostSMTPpwd = "projectigo201!";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "igoproj@naver.com";
		String fromName = "I GO";
		String subject = "";
		String msg = "";

		// 회원가입 메일 내용
		subject = "I GO 회원가입 인증 메일입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += approvalVO.getEmail().split("@")[0] + "님 회원가입을 환영합니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
		msg += "<form method='post' action='http://localhost:8080/IGOProject/approval/send'>";
		msg += "<input type='hidden' name='email' value='" + approvalVO.getEmail() + "'>";
		msg += "<input type='hidden' name='key' value='" + approvalVO.getKey() + "'>";
		msg += "<input type='submit' value='인증'></form><br/></div>";

		// 받는 사람 E-Mail 주소
		String mail = approvalVO.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

}
