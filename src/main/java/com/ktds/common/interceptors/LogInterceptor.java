package com.ktds.common.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ktds.common.Session;
import com.ktds.member.vo.MemberVO;

public class LogInterceptor extends HandlerInterceptorAdapter {

	
	private Logger qosLogger = LoggerFactory.getLogger("search");
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute(Session.USER);
		String searchKeyword= request.getParameter("searchKeyword");
		
		String logData = null;
		if ( memberVO != null ) {
			logData = "#"+request.getRemoteAddr() +"#" + request.getRequestURI() + "#" + memberVO.getEmail() + "#" + searchKeyword;
		}
		else {
			logData = "#"+request.getRemoteAddr() +"#" + request.getRequestURI() + "##" + searchKeyword;
		}
		qosLogger.debug( logData );
		return true;
	}
	
}
