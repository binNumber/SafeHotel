package com.app.interceptor.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.app.utiil.LoginManager;

@Component
public class MypageCheckLoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();
		
		boolean result = true;
		
		if(LoginManager.isSessionLogin(request, session) == false) {
			//세션에 로그인 값이 없을 경우
			
			response.sendRedirect("/signupMain");
			result = false;
		}
		
		return result;
	}
}
