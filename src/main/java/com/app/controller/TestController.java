package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class TestController {

	@GetMapping("/test")
	public String test() {
		return "test";
	}
	
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
}
