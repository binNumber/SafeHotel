package com.app.controller.customer;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.IncorrectResultSetColumnCountException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.reservation.Reservation;
import com.app.dto.user.ModifyUser;
import com.app.dto.user.User;
import com.app.service.reservation.ReservationService;
import com.app.service.user.UserService;
import com.app.utiil.LoginManager;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	UserService userService;	//유저 서비스

	@Autowired
	ReservationService reservationService;	//예약 서비스

	//user mypage
	@GetMapping("/checkPw")
	public String CheckPw(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, Model model) {

		//비밀번호 확인을 이미 완료한 경우
		boolean isCheckPw = false;

		if(session != null && session.getAttribute("isCheckPw") != null) {
			isCheckPw = true;
		}

		if(isCheckPw) {	//isCheckPw가 true인 경우

			//알림창 띄우고 유저 정보 확인 페이지로 이동
			model.addAttribute("checkMsg", "비밀번호 확인이 이미 완료되었습니다.");
			return "redirect:/mypage/userInfo";
		}

		//문제 없으면 비밀번호 확인 페이지로 이동
		return "customer/mypage/mypage_pwcheck";
	}


	//비밀번호 체크 액션
	@PostMapping("/checkPw")
	public String checkPwAction(@RequestParam String userPw,
			HttpSession session) {

		User user = (User)session.getAttribute("user");

		if(user.getUserPw().equals(userPw)) { //비밀번호 일치

			//세션에 비밀번호 확인에 대한 true로 저장
			session.setAttribute("isCheckPw", "OK");

			//비밀번호 일치했다는 메세지 전달
			return "redirect:/mypage/userInfo";

		} else { //비밀번호 불일치

			//비밀번호가 일치하지 않는다는 경고창 띄운 후 체크페이지로 이동
			return "customer/mypage/mypage_pwcheck";
		}
	}


	//유저 정보 확인 및 변경
	@GetMapping("/userInfo")
	public String mypageUserInfo() {

		//모두 문제 없으면 userInfo 페이지로 이동
		return "customer/mypage/mypage_userInfo";
	}


	//유저 정보 변경 액션
	@PostMapping("/ModifyuserInfo")
	public String userModifyAction(ModifyUser modifyUser,
			HttpSession session, Model model,
			HttpServletRequest request) {

		User user;

		if(session.getAttribute("user") != null) {

			//세션에서 유저정보 받기
			user = (User)session.getAttribute("user");
		} else {

			//LoginManager에서 userCode 받아오기
			int userCode = LoginManager.getUserCodeByCookie(request);

			user = userService.findUserByUserCode(userCode);
		}

		//modifyUser 정보로 user 값 변경
		if(modifyUser.getUserPw() != null && !modifyUser.getUserPw().trim().isEmpty()) {
			//비밀번호는 입력 안 할 수 있음
			//비밀번호 값이 없으면 기존 비밀번호 그대로
			user.setUserPw(modifyUser.getUserPw());
		}
		user.setUserNickname(modifyUser.getUserNickname());
		user.setUserPhoneNum(modifyUser.getUserPhoneNum());
		user.setUserAddr(modifyUser.getUserAddr());

		int result = userService.updateUserInfo(user);

		if(result > 0) {//저장 완료

			model.addAttribute("succesMsg", "정보 수정이 완료되었습니다.");

		} else {//저장 실패

			model.addAttribute("falseMsg", "회원 정보 수정에 실패했습니다. 다시 시도해 주세요.");
		}

		return "customer/mypage/mypage_userInfo";
	}

	//숙소 예약 정보 확인 //예약된 숙소 리스트 확인
	@GetMapping("/checkReservation/confirmed")
	public String confiremdeReservation(HttpSession session, Model model) {

		//세션에서 유저값 받아와서 저장
		User user = (User)session.getAttribute("user");

		int userCode = user.getUserCode();

		//userCode 기반으로 예약리스트 불러오기
		List<Reservation> reserveList =  reservationService.findReservationListByUseCode(userCode);

		//예약 완료된(아직 이용X) 리스트
		List<Reservation> comfirmedList = new ArrayList<Reservation>();

		if(reserveList != null) {

			for(Reservation rv : reserveList) {
				//상태값이 1(예약 승인)인 경우만 불러오기
				if(rv.getRsvtStatus() == 1) {
					comfirmedList.add(rv);
				}
			}
		}

		//예약 완료된 리스트만 정보 전달
		model.addAttribute("comfirmedList", comfirmedList);

		return "customer/mypage/checkReserve/confirmed_reservation";
	}

	//숙소 예약 정보 확인 //이용 완료된 예약
	@GetMapping("/checkReservation/complete")
	public String completeReservation(HttpSession session, Model model) {

		//세션에서 유저값 받아와서 저장
		User user = (User)session.getAttribute("user");

		int userCode = user.getUserCode();

		//userCode 기반으로 예약리스트 불러오기
		List<Reservation> reserveList =  reservationService.findReservationListByUseCode(userCode);

		//예약 완료된(아직 이용X) 리스트
		List<Reservation> completedList = new ArrayList<Reservation>();

		if(reserveList != null) {

			for(Reservation rv : reserveList) {
				//상태값이 2(이용 완료)인 경우만 불러오기
				if(rv.getRsvtStatus() == 2) {
					completedList.add(rv);
				}
			}
		}

		//예약 완료된 리스트만 정보 전달
		model.addAttribute("completedList", completedList);

		return "customer/mypage/checkReserve/complete_reservation";
	}

	//숙소 예약 정보 확인 //예약 취소된 리스트
	@GetMapping("/checkReservation/cancelled")
	public String mypageCheckReserve(HttpSession session, Model model) {

		//세션에서 유저값 받아와서 저장
		User user = (User)session.getAttribute("user");

		int userCode = user.getUserCode();

		//userCode 기반으로 예약리스트 불러오기
		List<Reservation> reserveList =  reservationService.findReservationListByUseCode(userCode);

		//예약 완료된(아직 이용X) 리스트
		List<Reservation> cancelledList = new ArrayList<Reservation>();

		if(reserveList != null) {

			for(Reservation rv : reserveList) {
				//상태값이 3(예약 취소)인 경우만 불러오기
				if(rv.getRsvtStatus() == 3) {
					cancelledList.add(rv);
				}
			}
		}

		//예약 완료된 리스트만 정보 전달
		model.addAttribute("cancelledList", cancelledList);

		return "customer/mypage/checkReserve/cancelled_reservation";
	}

	@RequestMapping("/checkReservation/cancel")
	public String reserveCancellAction(@RequestParam String rsvtCode, Model model) {
		
		//예약 코드 기반으로 예약상태(rsvtStatus) 3으로 변경
		int result = reservationService.updateRsvtStatusByRsvtCode(rsvtCode);
		
		if(result > 0) { //상태 변경 완료
			model.addAttribute("successMsg", "예약이 정상적으로 취소되었습니다.");
			
			//예약 취소 확인창으로 이동
			return "redirect:/mypage/checkReservation/cancelled";
			
		} else { //상태변경 실패
			model.addAttribute("예약 취소 처리 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.");
			
			return "redirect:/mypage/checkReservation/complete";
		}
	}
	
	@GetMapping("/checkReservation/reservationInfo")
	public String reservationInfo(@RequestParam String rsvtCode, Model model) {
		
//		Reservation reservation = reservationService.findResrvationByRsvtCode(rsvtCode);
		
		return "customer/mypage/checkReserve/checkReserve_reservationInfo";
	}
	
	//리뷰작성
	@GetMapping("/review")
	public String mypageReview(HttpSession session, Model model) {


		return "customer/mypage/mypage_review";
	}

	//쿠폰 확인
	@GetMapping("/useableCoupon")
	public String mypageUseableCoupon(HttpSession session, Model model) {


		return "customer/mypage/mypage_coupon";
	}

}
