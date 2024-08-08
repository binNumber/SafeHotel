package com.app.controller.customer;

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
import com.app.service.user.UserService;

@Controller
public class MypageController {


	@Autowired
	UserService userService;

	//user mypage
	@GetMapping("/mypage/checkPw")
	public String CheckPw(HttpSession session, HttpServletResponse response) {
		
//		//session에서 user값 받아오기
//		User user = (User) session.getAttribute("user");
//
//		if(user != null) {	//로그인이 되어있을 경우 비밀번호 확인 페이지로
//
//			Cookie isCheckPw = new Cookie("isCheckPw", "true");
//			isCheckPw.setMaxAge(60*60);
//			response.addCookie(isCheckPw);
//
//			return "user/cus/mypage/mypage_usercheck";
//
//		} else { 	//로그인이 안되어 있을 경우 login 페이지로
//
//			//로그인해주세요 라는 경고창 띄울 예정
//
//			return "redirect:/userlogin";
//		}
		
		return "user/cus/mypage/mypage_pwcheck";
	}

	@PostMapping("/mypage/checkPw")
	public String checkPwAction(@RequestParam String userPw,
			HttpSession session) {
		
		User user = (User)session.getAttribute("user");
		
		if(user.getUserPw().equals(userPw)) { //비밀번호 일치
			
			//비밀번호 일치했다는 메세지 전달
			return "redirect:/mypage/useInfo";
		} else { //비밀번호 불일치
			
			//비밀번호가 일치하지 않는다는 경고창 띄운 후 체크페이지로 이동
			return "user/cus/mypage/mypage_pwcheck";
		}

		
	}



	@GetMapping("/mypage/useInfo")
	public String mypageUserInfo(HttpSession session, Model model) {

//		User user = (User)session.getAttribute("user");
//		model.addAttribute(user);
		
		return "user/cus/mypage/mypage_userInfo";
	}
	
	@GetMapping("/mypage/checkReserve")
	public String mypageCheckReserve(HttpSession session, Model model) {
		
//		User user = (User)session.getAttribute("user");
//		model.addAttribute(user);
		
		return "user/cus/mypage/mypage_checkReserve";
	}
	
	@GetMapping("/mypage/review")
	public String mypageReview(HttpSession session, Model model) {
		
//		User user = (User)session.getAttribute("user");
//		model.addAttribute(user);
		
		return "user/cus/mypage/mypage_review";
	}
	
	@GetMapping("/mypage/coupon")
	public String mypageCoupon(HttpSession session, Model model) {
		
//		User user = (User)session.getAttribute("user");
//		model.addAttribute(user);
		
		return "user/cus/mypage/mypage_coupon";
	}

}
