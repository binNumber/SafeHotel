package com.app.controller;

import javax.servlet.http.Cookie;
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
	public String main(HttpSession session, Model model) {
		
		//session에서 유저 정보 가져옴
		User user =(User) session.getAttribute("user");
		
		if(user != null) { //유저 정보가 있을 경우
			model.addAttribute("user", user);
		}
		
		return "main";
	}
	
}
