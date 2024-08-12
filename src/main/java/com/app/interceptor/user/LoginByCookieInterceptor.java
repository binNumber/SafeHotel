package com.app.interceptor.user;

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
public class LoginByCookieInterceptor implements HandlerInterceptor {
	//적용 안되고 있는 상태
	
	@Autowired
	UserService userService;
	
	//브라우저에 로그인 쿠키값이 있으면 자동으로 로그인 시키는 인터셉터
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();
		
//		LoginManager loginManager = new LoginManager();
		int userCode= LoginManager.getUserCodeByCookie(request);
		//DB 조회
		//loginManger -> 처리 요청 -> 응답
		// 응답 -> 처리
		
		if(userCode > 0) {
			//브라우저에 usercode에 대한 쿠키 값이 있는 경우
			//User 저장
			User user = userService.findUserByUserCode(userCode);
			
			if(user != null) { //user 값이 정상적으로 받아와지면
				session.setAttribute("user", user);
			}
		}
		
		return true;
	}
	
}
