package com.app.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	@GetMapping("/signup")
	public String sign() {
		return "user/signUp";
	}
	
	@GetMapping("/user/mypage")
	public String CEOMypage() {
		return "user/myPage";
	}
}
