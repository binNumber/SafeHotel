package com.app.controller.customer;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.IncorrectResultSetColumnCountException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.dto.api.ApiResponse;
import com.app.dto.api.ApiResponseHeader;
import com.app.dto.reservation.Reservation;
import com.app.dto.reservation.ReservationAmount;
import com.app.dto.reservation.ReservationGuestInfo;
import com.app.dto.review.ModifyReviewCondition;
import com.app.dto.review.Review;
import com.app.dto.review.ReviewImg;
import com.app.dto.review.WriteReviewForm;
import com.app.dto.user.ModifyUser;
import com.app.dto.user.MypageSearchNickname;
import com.app.dto.user.User;
import com.app.dto.user.UserSignupDupCheckRequest;
import com.app.dto.user.MypageUserInfoDupCheckRequest;
import com.app.service.reservation.ReservationService;
import com.app.service.review.ReviewService;
import com.app.service.user.UserService;
import com.app.utiil.ImgFileManager;
import com.app.utiil.LoginManager;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	UserService userService;	//유저 서비스

	@Autowired
	ReservationService reservationService;	//예약 서비스

	@Autowired
	ReviewService reviewService;	//리뷰 서비스

	//user mypage
	@GetMapping("/checkPw")
	public String CheckPw() {

		return "customer/mypage/mypage_pwcheck";
	}


	//비밀번호 체크 액션
	@PostMapping("/checkPw")
	public String checkPwAction(@RequestParam String userPw,
			HttpSession session) {

		User user = LoginManager.getUserBySession(session);

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
	public String userModifyAction(@Valid @ModelAttribute ModifyUser modifyUser,
			HttpSession session, Model model) {

		boolean isNicknameAvailable = false;

		if(session.getAttribute("isNicknameAvailable") != null) {
			isNicknameAvailable = (boolean)session.getAttribute("isNicknameAvailable");
		}

		if(isNicknameAvailable) { //닉네임 사용 가능 -> 회원가입 계속 진행
			//세션에서 유저정보 받기(비밀번호를 변경하지 않는 경우를 상정해서 값을 받아옴)
			User user = (User)session.getAttribute("user");

			//modifyUser 정보로 user 값 변경
			user.setUserPw(modifyUser.getUserPw());
			user.setUserNickname(modifyUser.getUserNickname());
			user.setUserPhoneNum(modifyUser.getUserPhoneNum());
			user.setUserAddr(modifyUser.getUserAddr());

			int result = userService.updateUserInfo(user);

			if(result > 0) {//저장 완료

				model.addAttribute("Msg", "정보 수정이 완료되었습니다.");

			} else {//저장 실패

				model.addAttribute("Msg", "회원 정보 수정에 실패했습니다. 다시 시도해 주세요.");
			}
		} else {

			model.addAttribute("Msg", "닉네임 중복 확인이 필요합니다. 중복 확인 후 다시 시도해주세요.");
		}

		return "customer/mypage/mypage_userInfo";
	}

	//닉네임 중복확인
	@ResponseBody
	@RequestMapping("/isNicknameDuplicate")
	public ApiResponse<String> isNicknameDuplicateAction(@RequestBody MypageUserInfoDupCheckRequest dupCheckuser,
			HttpSession session) {

		System.out.println(dupCheckuser.getUserNickname());

		ApiResponse<String> response = null;
		ApiResponseHeader header = null;

		if(dupCheckuser.getUserNickname() != null || dupCheckuser.getUserNickname().trim().equals("")) {

			//유저코드를 받아오기 위해 세션에서 유저값 저장
			User user = (User)session.getAttribute("user");

			//기존의 닉네임도 사용 가능하다고 표시하기 위한 것
			MypageSearchNickname checkNickname = new MypageSearchNickname();
			checkNickname.setNickname(dupCheckuser.getUserNickname());
			checkNickname.setUserCode(user.getUserCode());

			//유저 닉네임이 사용 가능한지 여부 판단(false-중복X사용O / true-중복O/사용X)
			boolean isNicknameDuplicate = userService.isNicknameDuplicate(checkNickname);

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


	//숙소 예약 정보 확인 //예약된 숙소 리스트 확인
	@GetMapping("/checkReservation/confirmed")
	public String confiremdeReservation(HttpSession session, Model model) {

		//세션에서 유저값 받아와서 저장
		User user = LoginManager.getUserBySession(session);

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
		User user = LoginManager.getUserBySession(session);

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
		User user = LoginManager.getUserBySession(session);

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

		//예약코드 기반으로 

		//예약 완료된 리스트만 정보 전달
		model.addAttribute("cancelledList", cancelledList);

		return "customer/mypage/checkReserve/cancelled_reservation";
	}

	//예약 취소
	@RequestMapping("/checkReservation/cancel")
	public String reserveCancellAction(@RequestParam String rsvtCode, Model model) {

		//예약 코드 기반으로 예약상태(rsvtStatus) 3으로 변경
		int result = reservationService.updateRsvtStatusByRsvtCode(rsvtCode);

		if(result > 0) { //상태 변경 완료
			model.addAttribute("Msg", "예약이 정상적으로 취소되었습니다.");

			//예약 취소 확인창으로 이동
			return "redirect:/mypage/checkReservation/cancelled";

		} else { //상태변경 실패
			model.addAttribute("예약 취소 처리 중 문제가 발생했습니다. 잠시 후 다시 시도해주세요.");

			return "redirect:/mypage/checkReservation/complete";
		}
	}

	//예약 상세정보 확인
	@GetMapping("/checkReservation/reservationInfo")
	public String reservationInfo(@RequestParam String rsvtCode, Model model) {

		Reservation reservation = reservationService.findResrvationByRsvtCode(rsvtCode);

		if(reservation != null) {
			//int값의 숫자를 천단위로 끊어서 금액으로 표시(ex. 80,000)
			NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.KOREA);

			//int 값으로 된 금액들을 String 형태로 변경해서 금액 DTO에 저장
			ReservationAmount rsvtAmount = new ReservationAmount();
			rsvtAmount.setRsvtRoomAmount(numberFormat.format(reservation.getRsvtRoomAmount()));	//객실금액
			rsvtAmount.setRsvtPaymentAmount(numberFormat.format(reservation.getRsvtPaymentAmount()));	//총 금액

			//할인금액
			if(reservation.getRsvtDiscount() == 0) {
				rsvtAmount.setRsvtDiscountAmount("0");
			} else {

				String discountAmount = ((int)(((reservation.getRsvtPaymentAmount()/reservation.getRsvtDiscount())/100.0) * 100)) + "";

				rsvtAmount.setRsvtRoomAmount(discountAmount);
			}

			//할인금액 = 총 금액/할인금액

			model.addAttribute("reservation", reservation);
			model.addAttribute("rsvtAmount", rsvtAmount);
		} else {
			model.addAttribute("errorMsg", "예약 정보를 찾을 수 없습니다. 다시 한 번 확인해 주세요.");
		}

		return "customer/mypage/checkReserve/checkReserve_reservationInfo";
	}

	//예약자 정보 변경
	@PostMapping("/checkReservation/modifyGusetInfo")
	public String modifyGuestInfo(ReservationGuestInfo guestInfo) {

		//예약자 정보 변경
		int result = reservationService.updateGuestInfo(guestInfo);

		if(result >0) {
			System.out.println("예약자 변경이 완료되었습니다.");
		} else {
			System.out.println("예약자 변경에 실패했습니다. 다시 시도해주세요.");
		}

		return "redirect:/mypage/checkReservation/reservationInfo?rsvtCode="+guestInfo.getRsvtCode();

	}

	//유저가 작성한 리뷰 리스트 확인
	@GetMapping("/review")
	public String mypageReview(HttpSession session, Model model) {

		//세션에서 유저 값 받아와서 적용
		User user = (User)session.getAttribute("user");

		//유저 코드 기반으로 리뷰 리스트 불러오기
		int userCode = user.getUserCode();

		List<Review> reviewList = reviewService.findReviewListByUserCode(userCode);

		if(reviewList != null && !reviewList.isEmpty()) {

			for(Review rv : reviewList) {

				List<ReviewImg> rvImgList = reviewService.findReviewImgListByReviewCode(rv.getReviewCode());

				rv.setReviewImgList(rvImgList);
			}

			model.addAttribute("reviewList", reviewList);
		}

		return "customer/mypage/mypage_review";
	}

	//리뷰 수정 팝업에 가져갈 Review 객체 반환
	@RequestMapping(value = "/mypage/review", method = RequestMethod.POST)
	@ResponseBody
	public Review getReview(@RequestBody Review reviewInput) {

		System.out.println("===reviewCode 받음====");
		System.out.println(reviewInput.getReviewCode());

		Review review = null;

		//가져온 리뷰코드 int 값으로 변경
		int reviewCode = reviewInput.getReviewCode(); //Integer.parseInt(reviewCode);

		//리뷰코드 기반으로 Review 불러오기
		review = reviewService.findReviewByReviewCode(reviewCode);

		if(review != null) {
			List<ReviewImg> reviewImgList = reviewService.findReviewImgListByReviewCode(reviewCode);

			review.setReviewImgList(reviewImgList);
		}

		return review;

	}

	//작성한 리뷰 내용을 DB로 전달
	@RequestMapping("/savetReview")
	//@PostMapping("/savetReview")
	public String saveReview(WriteReviewForm reviewForm, Model model) {

		//		System.out.println(reviewForm.getUserCode());
		//		//form으로 값을 보내는 건 가능한데, userCode 값을 제외한 모든 값을 받아오지 못함
		//		System.out.println(reviewForm.getReviewText());
		//		System.out.println(reviewForm.getRsvtCode());
		//		System.out.println(reviewForm.getRating());

		//form에서 받아온 리뷰 정보 저장
		Review review = new Review();
		int reviewCode = reviewService.getNextReviewCode();
		review.setReviewCode(reviewCode);
		review.setUserCode(reviewForm.getUserCode());
		review.setRsvtCode(reviewForm.getRsvtCode());
		review.setAcmCode(reviewForm.getAcmCode());
		review.setRoomCode(reviewForm.getRoomCode());
		review.setRating(reviewForm.getRating());
		review.setReviewText(reviewForm.getReviewText());

		//		System.out.println(review.getReviewCode());
		//		System.out.println(review.getReviewText());
		//		System.out.println(review.getRsvtCode());

		if(review != null) {

			//DB에 리뷰 저장
			int reviewResult = reviewService.saveUserReview(review);

			if(reviewResult > 0) {
				System.out.println("리뷰 저장 성공");

				//리뷰 이미지 저장
				List<MultipartFile> InputImgList = reviewForm.getReviewImgFile();

				for(MultipartFile img : InputImgList) {

					ReviewImg reviewImg = null;

					try {
						reviewImg = ImgFileManager.saveFile(img, review);

						//리뷰이미지 다음 코드 뽑아오기
						int reviewImgCode = reviewService.getNextReviewImgCode();
						reviewImg.setReviewImgCode(reviewImgCode);

						System.out.println(reviewImg.getReviewImgCode());
						System.out.println(reviewImg.getReviewCode());
						System.out.println(reviewImg.getReviewImgOriginName());
						System.out.println(reviewImg.getReviewImgSaveName());
						System.out.println(reviewImg.getReviewImgExtension());
						System.out.println(reviewImg.getReviewImgUrl());

						if(reviewImg != null) {

							int imgresult = reviewService.saveReviewImg(reviewImg);

							if(imgresult > 0) {
								System.out.println(reviewImgCode + "저장 성공");

								//								return "redirect:/mypage/review";

							} else {
								System.out.println(reviewImgCode + "저장 실패");
							}
						}

					} catch (IllegalStateException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			} else {
				System.out.println("리뷰 저장 실패");
			}
		}
		return "redirect:/mypage/checkReservation/complete";

	}

	@PostMapping("/modifyReview")
	public String modifyReview(ModifyReviewCondition modifyReview,
			RedirectAttributes redirectAttributes) {

		int reviewResult = reviewService.modifyReivew(modifyReview);

		if(reviewResult > 0) {
			System.out.println("리뷰 수정 성공");

			//리뷰코드 기반으로 리뷰 불러오기
			Review review = reviewService.findReviewByReviewCode(modifyReview.getReviewCode());

			//리뷰 이미지 저장
			List<MultipartFile> inputImgList = modifyReview.getReviewImgFile();
			
			//결과 전달
			String alertMsg = null;
			
			for(MultipartFile img : inputImgList) {
				
				try {
				
					ReviewImg reviewImg = ImgFileManager.saveFile(img, review);
					
					int reviewImgCode = reviewService.getNextReviewImgCode();
					reviewImg.setReviewCode(reviewImgCode);
					
					int imgResult = reviewService.saveReviewImg(reviewImg);
					
					if(imgResult > 0) {
						System.out.println("이미지 저장 성공");
						alertMsg = "리뷰를 성공적으로 수정했습니다.";
					} else {
						System.out.println("이미지 저장 실패");
						alertMsg = "리뷰를 수정하지 못했습니다. 다시 시도해주세요.";
					}
				
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			redirectAttributes.addFlashAttribute("alertMsg", alertMsg);
		}

		return "redirect:/mypage/review";
	}

	//쿠폰 확인
	@GetMapping("/useableCoupon")
	public String mypageUseableCoupon(HttpSession session, Model model) {


		return "customer/mypage/coupon/mypage_coupon_useable";
	}

	//쿠폰 확인
	@GetMapping("/usedCoupon")
	public String mypageUseadCoupon(HttpSession session, Model model) {


		return "customer/mypage/coupon/mypage_coupon_used";
	}

}
