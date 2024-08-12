package com.app.controller.business;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.app.dto.user.User;
import com.app.service.business.BusinessService;
import com.app.service.user.UserService;
import com.app.utiil.LoginManager;

@Controller
public class BusinessController {

	@Autowired
	UserService userService;
	BusinessService businessService;

	// 사업자 메인
	@GetMapping("/businessMain")
	public String businessMain(HttpSession session, Model model) {
		
		if(!LoginManager.isLogin(session)) {
			return "/";
		}
		
		String id = LoginManager.getLoginUserId(session);
		User user = userService.findUserById(id);

		model.addAttribute("user", user);
		
		return "business/businessMain";
	}
	
	// 사업장 등록
	@GetMapping("/businessRegister")
	public String registerBusiness() {
		return "business/lodging/businessRegister";
	}
	
	// 사업장 관리
	@GetMapping("/businessManagement")
	public String manageBusiness() {
		return "business/lodging/businessManagement";
	}
	
	// 사업자 대기 예약 조회
	@GetMapping("/businessWaitingReservation")
	public String selectWaitingReservation() {
		return "business/reservation/businessWaitingReservation";
	}
	
	// 예약 관리
	@GetMapping("/businessReservationManagement")
	public String manageReservation() {
		return "business/reservation/businessReservationManagement";
	}
	
	// 리뷰 조회
	@GetMapping("/review")
	public String selectReview() {
		return "business/review/review";
	}
	
	// 리뷰 조회
	@GetMapping("/reviewManagement")
	public String manageReview() {
		return "business/review/reviewManagement";
	}
	
}
