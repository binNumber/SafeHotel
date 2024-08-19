package com.app.controller.business;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.app.dto.admin.Accommodation;
import com.app.dto.api.BusinessUserUpdatdReq;
import com.app.dto.business.Business;
import com.app.dto.user.User;
import com.app.service.business.BusinessService;
import com.app.service.user.UserService;
import com.app.utiil.LoginManager;

@Controller
public class BusinessController {

	@Autowired
	UserService userService;
	
	@Autowired	
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
	public String registerBusiness(HttpSession session, Model model) {
		
		if(!LoginManager.isLogin(session)) {
			return "main";
		}
		
		String id = LoginManager.getLoginUserId(session);
		User user = userService.findUserById(id);

		Business business = businessService.findBusinessByUserCode(user.getUserCode());

		model.addAttribute("business", business);
		model.addAttribute("user", user);
		
		return "business/lodging/businessRegister";
	}
	
	// 사업장 등록 액션
	@PostMapping("/businessRegister")
	public String registerBusiness(Accommodation accm, HttpSession session) {
		
		if(!LoginManager.isLogin(session)) {
			return "main";
		}
		
		String id = LoginManager.getLoginUserId(session);
		User user = userService.findUserById(id);
		
		System.out.println(user.getUserCode());
		
		accm.setAcmRegDt(Date.valueOf(LocalDate.now()));
		accm.setAcmStatus("1");
		
		int result = businessService.saveAccommodation(accm);
		if(result >= 1) {
			return "business/lodging/businessRegister";
		}

		return "business/lodging/businessRegister";
	}	
	
	// 사업장 관리
	@GetMapping("/businessManagement")
	public String manageBusiness(HttpSession session, Model model) {

		if(!LoginManager.isLogin(session)) {
			return "main";
		}
		
		String id = LoginManager.getLoginUserId(session);
		User user = userService.findUserById(id);
		
		Business business = businessService.findBusinessByUserCode(user.getUserCode());
		
		List<Accommodation> accmList = businessService.findAccmListByUserCode(user.getUserCode());
		
		model.addAttribute("accmList", accmList);
		model.addAttribute("business", business);
		model.addAttribute("user", user);
		
		return "business/lodging/businessManagement";
	}
	
	
	@GetMapping("/businessManagement/AcmDetail/{acmCode}")
	public String manageAcmDetail(HttpSession session, @PathVariable("acmCode") int acmCode, Model model) {
		
		if(!LoginManager.isLogin(session)) {
			return "main";
		}
		
		String id = LoginManager.getLoginUserId(session);
		User user = userService.findUserById(id);
		
		Business business = businessService.findBusinessByUserCode(user.getUserCode());
		
		model.addAttribute("business", business);
		model.addAttribute("user", user);
		
		return "business/lodging/businessAcmDetail";
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
