package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MainController {

	@GetMapping("/main")
	public String main() {
		return "main";
	}
	
	@GetMapping("/sign")
	public String sign() {
		return "sign";
	}
	
	@GetMapping("/userlogin")
	public String userlogin() {
		return "userlogin";
	}
	
	@GetMapping("/businesslogin")
	public String businesslogin() {
		return "businesslogin";
	}
	
	@GetMapping("/usersignup")
	public String usersignup() {
		return "usersignup";
	}
	
	@GetMapping("/usersignuppage")
	public String usersignuppage() {
		return "usersignuppage";
	}
	
	@GetMapping("/businesssignup")
	public String businesssignup() {
		return "businesssignup";
	}
}
