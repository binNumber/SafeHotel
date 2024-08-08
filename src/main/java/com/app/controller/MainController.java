package com.app.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;
import com.app.service.user.UserService;


@Controller
public class MainController {

	@Autowired
	UserService userService;


	@GetMapping("/main")
	public String main(HttpServletRequest request
			, HttpSession session, Model model) {

		User user = null;

		//브라우저에 userCode에 대한 쿠키값이 있는지 확인
		Cookie[] cookies = request.getCookies();

		if(cookies != null) { //cookies에 값이 있을 경우

			for(Cookie cookie : cookies) {
				if("userCode".equals(cookie.getName())) { //userCode 값을 가진 Cookie가 있음

					//cookie 값에서 userCode 뽑아서 int로 저장
					int userCode = Integer.parseInt(cookie.getValue());

					//userCode 바탕으로 유저 검색 후 user 값 저장
					user = userService.findUserByUserCode(userCode);

					//세션에 user정보 저장
					session.setAttribute("user", user);
				}
			}

			//session에서 유저 정보 가져옴(쿠키에 userCode값이 없지만, 세선에는 user 값이 있을 경우 고려)
			if(session.getAttribute("user") != null) {

				//세션에서 user 정보 저장
				user = (User)session.getAttribute("user");
				
				model.addAttribute("user", user);
			}
		}

		return "main";
	}

}
