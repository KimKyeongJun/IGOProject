package com.ktds.member.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.User;
import com.ktds.common.Session;
import com.ktds.member.service.MemberService;
import com.ktds.member.vo.MemberVO;

@Controller	
public class AuthenticationSuccessController implements AuthenticationSuccessHandler {

	@Autowired
	private MemberService memberService;

	@Override
	@ResponseBody
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = new MemberVO();
		
		//memberVO.setEmail(request.getParameter("email"));
		//memberVO.setPassword(request.getParameter("password"));
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getDetails();
		memberVO.setEmail(user.getSecurityEmail());
		memberVO.setPassword(user.getPassword());
		MemberVO loginMember = memberService.readOneMember(memberVO);
		
		PrintWriter out = response.getWriter();
		if ( loginMember != null ) {
			if(loginMember.getApprovalStatus().equalsIgnoreCase("N")) {
				out.write("approvalFail");
				return ;
			}
			session.setAttribute(Session.TOKEN, user.getToken());
			session.setAttribute(Session.USER, loginMember);
			out.write("loginSuccess");
		}
		else {
			out.write("loginFail");
		}
		out.flush();		
		
	}
	
}
