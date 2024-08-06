package com.app.controller.customer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;
import com.app.service.user.UserService;


@Controller
public class LoginController {

	@Autowired
	UserService userService;
	
	@GetMapping("/usersign")
	public String sign() {
		return "customer/sign";
	}
	
	//유저 로그인 페이지로 이동
	@GetMapping("/userlogin")
	public String userlogin() {
		return "customer/userlogin";
	}
	
	//유저 로그인 액션
	@PostMapping("/userlogin")
	public String userLoginAction(UserSearchCondition userSearchCondition,
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
			
			return "redirect:/main";
		} else { //일치하는 유저가 없음
			
			//경고창 띄우기
			
			return "customer/userlogin";
		}
	}
	
	//로그아웃
	@GetMapping("/userlogout")
	public String userLogout(HttpSession session, HttpServletResponse response) {
		
		session.invalidate();

		//로그인 유지 쿠키 삭제
		Cookie userCookie = new Cookie("user", null);
		userCookie.setMaxAge(0);//쿠키 즉시 만료
		userCookie.setPath("/");
		response.addCookie(userCookie);
		
		//로그아웃 후 main 페이지로 이동
		return "redirect:/main";
	}
	
	
	@GetMapping("/usersignup")
	public String usersignup() {
		
		
		return "customer/usersignup";
	}
	
	@GetMapping("/usersignuppage")
	public String usersignuppage() {
		return "customer/usersignuppage";
	}
}
