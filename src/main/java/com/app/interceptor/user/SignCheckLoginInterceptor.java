package com.app.interceptor.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.app.utiil.LoginManager;

@Component
public class SignCheckLoginInterceptor implements HandlerInterceptor {

	//로그인&회원가입 페이지에서 로그인이 되어있으면 메인으로 돌려보내기 위한 인터셉터
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		
		if(LoginManager.isSessionLogin(request, session)) {
			//세션에 로그인 값이 있을 경우
			
			response.sendRedirect("/");
			return false;
		}
		
		return true;
	}
}
