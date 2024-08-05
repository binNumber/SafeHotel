package com.app.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	@GetMapping("/signup")
	public String sign() {
		return "user/signUp";
	}
	
	@GetMapping("/user/mypageCEO")
	public String myPageCEO() {
		return "user/myPageCEO";
	}
	
	@GetMapping("/review/report")
	public String reviewReport() {
		return "user/reviewReportPopup";
	}
	
	@GetMapping("/user/mypageAdmin")
	public String myPageAdmin() {
		return "user/myPageAdmin";
	}
	
	@GetMapping("/user/mypageUser")
	public String myPageUser() {
		return "user/myPageUser";
	}
}
