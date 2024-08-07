package com.app.controller.business;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;
import com.app.service.user.UserService;

@Controller
public class BusinessController {

	@Autowired
	UserService userService;

	// 사업자 메인
	@GetMapping("/businessMain")
	public String businessMain() {
		return "business/businessmain";
	}
	
	//사업자 로그인
	@GetMapping("/businesslogin")
	public String businessLogin(UserSearchCondition userSearchCondition,
			@RequestParam(value = "checkRememberUser", defaultValue = "false") boolean checkRememberUser,
			HttpServletResponse response, HttpSession session) {

		//User user = userService.findUserByUserSearchCondition(userSearchCondition);

		return "business/businesslogin";
	}


	//사업자 로그인 액션
	@PostMapping("/businesslogin")
	public String businessLoginAction(UserSearchCondition userSearchCondition,
			@RequestParam(value = "checkRememberUser", defaultValue = "false") boolean checkRememberUser,
			HttpServletResponse response, HttpSession session) {

		//User 검색
		User user = userService.findUserByUserSearchCondition(userSearchCondition);


		if(user != null) {	//일치하는 유저가 있음

			//세션에 user 데이터 추가
			session.setAttribute("user", user);

			if(checkRememberUser) {

				String userSession = session.getId();


				//로그인 유지를 위해 쿠키값 유지
				Cookie userCookie = new Cookie("user", userSession);
				userCookie.setMaxAge(60*60*24*30);	//쿠키 유효기간 30일
				userCookie.setPath("/");	//모든 경로에서 쿠키 사용 가능
				response.addCookie(userCookie);

			}

			return "redirect:/user/mypageCEO";
		} else { //일치하는 유저가 없음

			//경고창 띄우기

			return "business/businesslogin";
		}
	}
	
	@GetMapping("/businesssignup")
	public String businesssignup() {
		return "business/businesssignup";
	}
	


}
