package com.app.controller.customer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.user.User;

@Controller
public class UserController {
	
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
		return "admin/myPageAdmin";
	}
	
	@GetMapping("/listpage")
	public String listpage() {
		return "customer/listpage";
	}
	
	@GetMapping("/roominfo")
	public String roominfo() {
		return "customer/roominfo";
	}
	
	@GetMapping("/reservationpage")
	public String reservationpage() {
		return "customer/reservationpage";
	}
}
