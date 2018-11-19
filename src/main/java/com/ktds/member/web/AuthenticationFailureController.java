package com.ktds.member.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.member.service.MemberService;
import com.ktds.member.vo.MemberVO;

@Controller("authenticationFailureController")
public class AuthenticationFailureController implements AuthenticationFailureHandler {

	@Autowired
	private MemberService memberService;

	@Override
	@ResponseBody
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			org.springframework.security.core.AuthenticationException exception) throws IOException, ServletException {
		
		MemberVO memberVO = new MemberVO();
		
		memberVO.setEmail(request.getParameter("securityEmail"));
		memberVO.setPassword(request.getParameter("password"));
		
		boolean isBlockUser = memberService.isBlockUser(memberVO.getEmail());
		
		MemberVO loginMember = memberService.readOneMember(memberVO);
		
		PrintWriter out = response.getWriter();
		
		if ( loginMember != null ) {
			if ( isBlockUser ) {
				out.write("block");
			}
		}
		else {
			out.write("loginFail");
		}
		out.flush();
	}
}
