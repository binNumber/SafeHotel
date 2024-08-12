package com.app.interceptor.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.app.dto.user.User;
import com.app.service.user.UserService;
import com.app.utiil.LoginManager;

@Component
public class CheckPwInterceptor implements HandlerInterceptor {

	//마이페이지 접속 전, 비밀번호 확인이 되었는지 확인("/mypage/checkPw" 제외)
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();
		
		//로그인매니저에서 비밀번호 확인 여부에 대한 값 받아오기(true-비밀번호 확인 / false-비밀번호 확인X)
		boolean result = LoginManager.isCheckPw(session);
		
		//비밀번호 확인이 안되어있을 경우
		if(result == false) {
			
			response.sendRedirect("/mypage/checkPw");
		}
		
		return result;
	}
}
