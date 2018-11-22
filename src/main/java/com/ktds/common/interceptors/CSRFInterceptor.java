package com.ktds.common.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ktds.common.Session;

public class CSRFInterceptor extends HandlerInterceptorAdapter {
	
	public boolean preHandler(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("POST")) {
			HttpSession session = request.getSession();
			String csrfTokenInSession = (String) session.getAttribute(Session.CSRF_TOKEN);
			String requestedCsrfToken = request.getParameter("csrfToken");
			if(csrfTokenInSession != null && csrfTokenInSession.equals(requestedCsrfToken)) {
				return true;
			}
			else {
				response.sendError(HttpServletResponse.SC_FORBIDDEN
						, "Bad or missing CSRF value");
				return false;
			}
		}
		return false;
 }
}
