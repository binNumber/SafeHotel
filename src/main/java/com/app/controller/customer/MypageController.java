package com.app.controller.customer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.user.User;
import com.app.service.user.UserService;

@Controller
public class MypageController {


	@Autowired
	UserService userService;

	//user mypage
	@GetMapping("/mypage/checkPw")
	public String CheckPw(HttpSession session, HttpServletResponse response) {

		//session에서 user값 받아오기
		User user = (User) session.getAttribute("user");

		if(user != null) {	//로그인이 되어있을 경우 비밀번호 확인 페이지로

			Cookie isCheckPw = new Cookie("isCheckPw", "true");
			isCheckPw.setMaxAge(60*60);
			response.addCookie(isCheckPw);

			return "user/cus/mypage_usercheck";

		} else { 	//로그인이 안되어 있을 경우 login 페이지로

			//로그인해주세요 라는 경고창 띄울 예정

			return "redirect:/userlogin";
		}
	}

	@PostMapping("/mypage/checkPw")
	public String checkPwAction(@RequestParam String userPw,
			HttpSession session) {

		return "redirect:/mypage/useInfo";
	}



	@GetMapping("/mypage/useInfo")
	public String mypageUserInfo() {

		return "";
	}

}
