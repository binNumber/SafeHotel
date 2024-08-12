package com.app.controller.business;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.app.dto.business.Business;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;
import com.app.service.business.BusinessService;
import com.app.service.user.UserService;
import com.app.utiil.LoginManager;

@Controller
public class BusinessUserController {

	@Autowired
	UserService userService;
	
	@Autowired
	BusinessService businessService;

	
	// 사업자 내 정보 조회
	@GetMapping("/businessMyPage")
	public String myPage(HttpSession session, Model model) {
		
		if(!LoginManager.isLogin(session)) {
			return "/";
		}
		
		String id = LoginManager.getLoginUserId(session);
		User user = userService.findUserById(id);
		
		Business business = businessService.findBusinessByUserCode(user.getUserCode());

		model.addAttribute("business", business);
		model.addAttribute("user", user);
		
		return "business/user/businessMyPage";
	}
	
	//사업자 로그인
	@GetMapping("/businesslogin")
	public String businessLogin() {
		return "business/user/businessLogin";
	}

	//사업자 로그인 액션
	@PostMapping("/businesslogin")
	public String businessLoginAction(UserSearchCondition userSearchCondition, HttpSession session) {

		
		//User 검색
		User user = userService.findUserByUserSearchCondition(userSearchCondition);

		if(user == null) {
			return "business/user/businesslogin";
		}
		
		//세션에 user 데이터 추가
		LoginManager.setSessionLogin(user.getUserEmail(), session);

		return "redirect:/businessMain";
	}
	
	//사업자 로그아웃
	@PostMapping("/businesslogout")
	public String businessLoginAction(HttpSession session) {
		
		LoginManager.logout(session);
		
		return "/";
	}
	
	// 사업자 회원가입
	@GetMapping("/businesssignup")
	public String businesssignup() {
		return "business/user/businesssignuppage";
	}
}
