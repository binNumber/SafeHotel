package com.app.controller.customer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;
import com.app.service.user.UserService;


@Controller
public class LoginController {

	@Autowired
	UserService userService;

	//로그인&회원가입 메인 화면
	@GetMapping("/signupMain")
	public String userSign() {

		return "customer/signup/signupMain";

	}


	//유저 로그인 페이지로 이동
	@GetMapping("/userlogin")
	public String userLogin() {
		//userCode 쿠키값이 있거나 user session 값이 있으면 알림창 띄우고 main 페이지로 이동

		return "customer/signup/userlogin";


	}

	//유저 로그인 액션
	@PostMapping("/userlogin")
	public String userLoginAction(UserSearchCondition userSearchCondition,
			@RequestParam(value = "checkRememberUser", defaultValue = "false") boolean checkRememberUser,
			HttpServletResponse response, HttpSession session, HttpServletRequest request) {

		//login 페이지에서 받아온 값을 바탕으로 user 검색
		User user = userService.findUserByUserSearchCondition(userSearchCondition);


		if(user != null) {	//일치하는 유저가 있음

			//세션에 user 데이터 추가
			session.setAttribute("user", user);

			if(checkRememberUser) {

				String userCode = Integer.toString(user.getUserCode());

				//로그인 유지를 위해 쿠키값 유지
				Cookie userCookie = new Cookie("userCode", userCode);
				userCookie.setMaxAge(60*60*24*30);	//쿠키 유효기간 30일
				userCookie.setPath("/");	//모든 경로에서 쿠키 사용 가능
				response.addCookie(userCookie);
			}

			return "redirect:/main";
		} else { //일치하는 유저가 없음

			//경고창 띄우기
			return "customer/signup/userlogin";
		}
	}

	//로그아웃
	@GetMapping("/userlogout")
	public String userLogout(HttpSession session, HttpServletResponse response) {

		//세션 값 모두 삭제
		session.invalidate();

		//userCode 쿠키 삭제
		Cookie userCodeCookie = new Cookie("userCode", null);
		userCodeCookie.setMaxAge(0);//쿠키 즉시 만료
		userCodeCookie.setPath("/");
		response.addCookie(userCodeCookie);

		//로그아웃 후 main 페이지로 이동
		return "redirect:/main";
	}

	//회원가입 전 약관 동의 페이지 불러오기
	@GetMapping("/signup-agreement")
	public String userSignupAgreement(HttpServletRequest request,
			HttpSession session, Model model) {

		return "customer/signup/usersignup_agreement";
	}


	//회원가입 화면 불러오기
	@GetMapping("/usersignup")
	public String userSignup() { 

		return "customer/signup/usersignup";
	}

	//회원가입 액션
	@PostMapping("/usersignup")
	public String userSingupAction(User user, @RequestParam boolean isNicknameAvailable,
			Model model) { //회원가입 정보 DB에 저장

		if(isNicknameAvailable) { //닉네임 사용가능 -> 회원가입 계속 진행

			user.setUserCode(userService.getNextUserCode());

			int result = userService.saveUserInfo(user);

			if(result > 0) { //유저 정보 저장 성공

				//성공메세지 전달 후 로그인 페이지로 이동
				model.addAttribute("successMsg", "회원가입이 완료되었습니다! 로그인 후 서비스를 이용해주세요.");
				return "redirect:/userlogin";

			} else { //유저 정보 저장 실패

				//실패메세지 전달 후 로그인 페이지로 이동
				model.addAttribute("falseMsg", "회원가입 실패. 다시 시도해주세요.");
				return "customer/signup/usersignup";
			}

		} else { //중복 확인이 되지 않았거나 닉네임이 중복

			//메세지 전달 후 회원가입 페이지로 다시 돌아가기
			model.addAttribute("dupMsg", "닉네임 중복 확인이 필요합니다. 중복 확인 후 다시 시도해주세요.");

			return "customer/signup/usersignup";
		}
	}

	//닉네임 중복확인
//	@RequestMapping("/usersignup/isNicknameDuplicate")
//	public String isNicknameDuplicateAction(String userNickname) {
//		
//		boolean result = false;
//		
//		//유저 닉네임이 사용 가능한지 여부 판단(false-중복X사용O / true-중복O/사용X)
//		boolean isNicknameDuplicate = userService.isNicknameDuplicate(userNickname);
//
//		if(isNicknameDuplicate != false) { //중복X사용가능
//			result = true;
//		} else {
//			result = false;
//		}
//		
//		return "forward:/usersignup";
//	}
}
