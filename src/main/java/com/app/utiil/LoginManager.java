package com.app.utiil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.app.dto.user.User;
import com.app.service.user.UserService;

public class LoginManager {

	//브라우저에 있는 userCode 반환하기
	public static int getUserCodeByCookie(HttpServletRequest request) {

		int result = 0;

		//브라우저에서 쿠키 불러오기
		Cookie[] cookies = request.getCookies();

		if(cookies != null) { //cookies에 값이 있을 경우

			for(Cookie cookie : cookies) {
				if("userCode".equals(cookie.getName())) {

					//userCode 값을 가진 Cookie가 있음 result 값으로 받음
					result = Integer.parseInt(cookie.getValue());
				}
			}
		}

		return result;
	}

	//세션에서 유저 값 받아와서 저장하기
	public static User getUserBySession(HttpSession session) {

		User user = (User)session.getAttribute("user");

		return user;
	}

	//세션에 유저 값이 있는지 체크
	public static boolean isSessionLogin(HttpServletRequest request, HttpSession session) {

		boolean result = false;

		if(session != null && session.getAttribute("user") != null) {
			//세션에 유저 값이 있을 경우
			
			result = true;
		}

		return result;
	}

	//비밀번호 확인이 완료되었는지 확인하는 메소드(true - 확인O / false - 확인X)
	public static boolean isCheckPw(HttpSession session) {

		boolean result = false;

		if(session != null && session.getAttribute("isCheckPw") != null) {

			//세션에 isCheckPw 값이 있으면 result true로 변경
			result = true;
		}

		return result;
	}

}
