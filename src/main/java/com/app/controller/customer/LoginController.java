package com.app.controller.customer;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.dto.api.ApiResponse;
import com.app.dto.api.ApiResponseHeader;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;
import com.app.dto.user.UserSignupDupCheckRequest;
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

		return "customer/signup/userlogin";
	}

	//유저 로그인 액션
	@PostMapping("/userlogin")
	public String userLoginAction(UserSearchCondition userSearchCondition,
			@RequestParam(value = "checkRememberUser", defaultValue = "false") boolean checkRememberUser,
			HttpServletResponse response, HttpSession session, HttpServletRequest request,
			RedirectAttributes redirect) {

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

			return "redirect:/";
		} else { //일치하는 유저가 없음

			//경고창 띄우기
			redirect.addFlashAttribute("msg", "입력한 아이디나 비밀번호가 맞지 않습니다. 다시 확인해 주세요.");
			
			return "redirect:/userlogin";
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
		return "redirect:/";
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
	public String userSingupAction(@Valid @ModelAttribute User user,
			HttpSession session, RedirectAttributes redirect) { //회원가입 정보 DB에 저장

		boolean isNicknameAvailable = false;
		
		if(session.getAttribute("isNicknameAvailable") != null) {
			isNicknameAvailable = (boolean)session.getAttribute("isNicknameAvailable");
		}
		
		if(isNicknameAvailable) { //닉네임 사용가능 -> 회원가입 계속 진행

			user.setUserCode(userService.getNextUserCode());

			int result = userService.saveUserInfo(user);

			if(result > 0) { //유저 정보 저장 성공
				
				//성공메세지 전달 후 로그인 페이지로 이동
				redirect.addFlashAttribute("msg", "회원가입이 완료되었습니다! 로그인 후 서비스를 이용해주세요.");
				
				//세션에서 isNicknameAvailable 값 삭제
				session.removeAttribute("isNicknameAvailable");
				
				return "redirect:/signupMain";

			} else { //유저 정보 저장 실패
				
				//실패메세지 전달 후 로그인 페이지로 이동
				redirect.addFlashAttribute("msg", "회원가입에 실패했습니다. 다시 시도해주세요.");
				return "customer/signup/usersignup";
			}

		} else { //중복 확인이 되지 않았거나 닉네임이 중복

			//메세지 전달 후 회원가입 페이지로 다시 돌아가기
			redirect.addFlashAttribute("msg", "닉네임 중복 확인이 필요합니다. 중복 확인 후 다시 시도해주세요.");

			return "customer/signup/usersignup";
		}		
	}

	//닉네임 중복확인
	@ResponseBody
	@RequestMapping("/usersignup/isNicknameDuplicate")
	public ApiResponse<String> isNicknameDuplicateAction(@RequestBody UserSignupDupCheckRequest user,
			HttpSession session) {
		
		ApiResponse<String> response = null;
		ApiResponseHeader header = null;
		
		System.out.println(user.getUserNickname());
		String userNickname = user.getUserNickname();
		
		if(userNickname != null || userNickname.trim().equals("")) {//닉네임 값이 비어있지 않을 때
		
			//유저 닉네임이 사용 가능한지 여부 판단(false-중복X사용O / true-중복O/사용X)
			boolean isNicknameDuplicate = userService.isNicknameDuplicate(userNickname);

			response = new ApiResponse<String>();
			header = new ApiResponseHeader();
			response.setBody(user.getUserNickname());
			
			if(isNicknameDuplicate == false) { //중복X사용O
				header.setResultCode("200");
				header.setResultMessage("사용 가능한 닉네임입니다.");
				
				//닉네임 사용 여부에 대한 세션 값 저장
				session.setAttribute("isNicknameAvailable", true);
			} else { //중복O사용X
				header.setResultCode("400");
				header.setResultMessage("사용할 수 없는 닉네임입니다. 다시 입력해주세요.");
				
				//닉네임 사용 여부에 대한 세션 값 저장
				session.setAttribute("isNicknameAvailable", false);
			}
			
			response.setHeader(header);
			
		}

		return response;
	}
	
	//회원탈퇴
	@GetMapping("/userDeactivation")
	public String userDeactivation(int userCode,
			HttpSession session, HttpServletResponse response,
			RedirectAttributes redirect) {
		
		//유저코드 기반으로 회원상태 정보 변경
		int result = userService.updateUserStatusByUserCode(userCode);
		
		if(result > 0) {
			
			redirect.addFlashAttribute("msg", "회원탈퇴에 성공했습니다.");
			
			//세션 값 모두 삭제
			session.invalidate();

			//userCode 쿠키 삭제
			Cookie userCodeCookie = new Cookie("userCode", null);
			userCodeCookie.setMaxAge(0);//쿠키 즉시 만료
			userCodeCookie.setPath("/");
			response.addCookie(userCodeCookie);

			//로그아웃 후 main 페이지로 이동
			return "redirect:/";
		} else {
			
			redirect.addFlashAttribute("msg", "회원탈퇴에 실패했습니다. 잠시 후 다시 시도해주세요.");
			
			return "redirect:/mypage/userInfo";
		}
	}
}
