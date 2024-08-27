package com.app.controller.customer;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.dto.Accommodation.Acm;
import com.app.dto.admin.AccommodationDetails;
import com.app.dto.admin.AccommodationImg;
import com.app.dto.main.SearchText;
import com.app.dto.map.Address;
import com.app.dto.map.Hospital;
import com.app.dto.map.PoliceStation;
import com.app.dto.reservation.Reservation;
import com.app.dto.reservation.ReservationAmount;
import com.app.dto.review.Review;
import com.app.dto.review.ReviewImg;
import com.app.dto.room.Room;
import com.app.dto.room.SearchRoomCondition;
import com.app.dto.user.User;
import com.app.service.accommodation.AccommodationService;
import com.app.service.map.MapService;
import com.app.service.reservation.ReservationService;
import com.app.service.review.ReviewService;
import com.app.service.room.RoomService;
import com.app.utiil.RoomAmountManager;

@Controller
public class UserController {

	@Autowired
	AccommodationService acmService;

	@Autowired
	RoomService roomService;

	@Autowired
	ReviewService reviewService;

	@Autowired
	ReservationService reservationService;

	@Autowired
	MapService mapService;
	
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

	@GetMapping("/roominfo")
	public String roominfo(SearchRoomCondition searchRoom, Model model) {

		model.addAttribute("searchRoom", searchRoom);

		int acmCode = searchRoom.getAcmCode();

		// 업소코드 기반으로 업소 정보 불러오기
		Acm acm = acmService.findAcmByAcmCode(acmCode);

		if (acm != null) {

			// 숙소 정보값 페이지에 전달
			model.addAttribute("acm", acm);
		}

		// 업소 코드 기반으로 숙소 세부정보 불러오기
		AccommodationDetails acmDetail = acmService.findAcmDetailByAcmCode(acmCode);

		
		if (acmDetail != null) {

			// %%로 저장된 내용 enter로 변경
			if (acmDetail.getAcmDtlIntroduction() != null)
				acmDetail.setAcmDtlIntroduction(acmDetail.getAcmDtlIntroduction().replace("%%", "<br>"));
			if (acmDetail.getAcmDtlNotice() != null)
				acmDetail.setAcmDtlNotice(acmDetail.getAcmDtlNotice().replace("%%", "<br>"));
			if (acmDetail.getAcmDtlInfo() != null)
				acmDetail.setAcmDtlInfo(acmDetail.getAcmDtlInfo().replace("%%", "<br>"));
			if (acmDetail.getAcmDtlUsageGuide() != null)
				acmDetail.setAcmDtlUsageGuide(acmDetail.getAcmDtlUsageGuide().replace("%%", "<br>"));
			if (acmDetail.getAcmDtlAddPersonnel() != null)
				acmDetail.setAcmDtlAddPersonnel(acmDetail.getAcmDtlAddPersonnel().replace("%%", "<br>"));
			if (acmDetail.getAcmDtlRoomInfo() != null)
				acmDetail.setAcmDtlRoomInfo(acmDetail.getAcmDtlRoomInfo().replace("%%", "<br>"));
			if (acmDetail.getAcmDtlFacilities() != null)
				acmDetail.setAcmDtlFacilities(acmDetail.getAcmDtlFacilities().replace("%%", "<br>"));
			if (acmDetail.getAcmDtlParking() != null)
				acmDetail.setAcmDtlParking(acmDetail.getAcmDtlParking().replace("%%", "<br>"));
			if (acmDetail.getAcmDtlTransport() != null)
				acmDetail.setAcmDtlTransport(acmDetail.getAcmDtlTransport().replace("%%", "<br>"));
			if (acmDetail.getAcmDtlBenefit() != null)
				acmDetail.setAcmDtlBenefit(acmDetail.getAcmDtlBenefit().replace("%%", "<br>"));
			if (acmDetail.getAcmDtlSurroundingInfo() != null)
				acmDetail.setAcmDtlSurroundingInfo(acmDetail.getAcmDtlSurroundingInfo().replace("%%", "<br>"));
			if (acmDetail.getAcmDtlGuide() != null)
				acmDetail.setAcmDtlGuide(acmDetail.getAcmDtlGuide().replace("%%", "<br>"));
			if (acmDetail.getAcmDtlPolicy() != null)
				acmDetail.setAcmDtlPolicy(acmDetail.getAcmDtlPolicy().replace("%%", "<br>"));
			if (acmDetail.getAcmDtlEtc() != null)
				acmDetail.setAcmDtlEtc(acmDetail.getAcmDtlEtc().replace("%%", "<br>"));

			model.addAttribute("acmDetail", acmDetail);
		}

		// 업소 코드 기반으로 숙소 대표 사진 불러오기
		AccommodationImg acmRepImg = acmService.findAcmRepImgbyAcmCode(acmCode);

		model.addAttribute("acmRepImg", acmRepImg);

		// 업소 코드 기반으로 숙소 사진리스트 불러오기
		List<AccommodationImg> acmImgList = acmService.findAcmImgListByAcmCode(acmCode);

		if (acmImgList != null) {

			model.addAttribute("acmImgList", acmImgList);

		}

		// 업소코드, 체크인 날짜, 체크아웃 날짜, 인원수 기반으로 객실 정보 불러오기
		List<Room> roomList = roomService.findRoomListBySearchRoomCondtion(searchRoom);
		// mapper에서 쿼리문 작성 후 적용만 하면 됨

		int availableRoom = 0;

		if (roomList != null) {

			for (Room r : roomList) {
				// 룸 가격 정보 저장
				r.setRoomAmount(RoomAmountManager.determinePrice(searchRoom, r));
				r.setRoomAmountStr(RoomAmountManager.getRoomAmount(searchRoom, r));

				// 룸이미지 저장
				List<AccommodationImg> roomImgList = null;
				for (AccommodationImg acmImg : acmImgList) {
					if (r.getRoomCode() == acmImg.getRoomCode()) {

						roomImgList = new ArrayList<AccommodationImg>();

						// 객실 코드가 일치하는 경우만 List에 추가
						roomImgList.add(acmImg);
					}
				}

				if (roomImgList != null) {
					// Room 객체에 roomImgList 추가
					r.setRoomImgList(roomImgList);
					r.setRoomRepImg(r.getRoomImgList().get(0));
				}

				if (r.getAvailableRooms() > 0) {
					availableRoom++;
				}
			}
		}

		if (availableRoom == 0) {
			System.out.println("null임");
		}

		model.addAttribute("roomList", roomList);
		model.addAttribute("availableRoom", availableRoom);

		// 업소 코드 기반으로 리뷰 불러오기
		List<Review> reviewList = reviewService.findReviewListByAcmCode(acmCode);

		int reviewCount = 0;
		int reviewTotalRating = 0;
		String reviewRatingAverageStr = null;

		if (reviewList != null) {
			for (Review rv : reviewList) {
				reviewCount++;
				reviewTotalRating += rv.getRating();

				int reviewCode = rv.getReviewCode();

				// 리뷰 코드 기반으로 리뷰 이미지 리스트 불러오기
				List<ReviewImg> reviewImg = reviewService.findReviewImgListByReviewCode(reviewCode);

				rv.setReviewImgList(reviewImg);
			}
		}

		if (reviewCount != 0 && reviewTotalRating != 0) { // 평점
			double doreviewRatingAverage = (double) reviewTotalRating / reviewCount;
			reviewRatingAverageStr = Double.toString(doreviewRatingAverage);
		}

		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("reviewRatingAverageStr", reviewRatingAverageStr);

		//지도에 적용하기 위한 주소
		String acmAddr = mapService.findAcmAddrByAcmCode(acmCode);
		
		if(acmAddr != null) {
			System.out.println("acmAddr 있음");
			System.out.println(acmAddr);
			
			model.addAttribute("acmAddr", acmAddr);
			
		}
		
		return "customer/roominfo";
	}
	
	//Ajax로 가져갈 병원 정보
	@RequestMapping("/api/hospitals")
	@ResponseBody
	public List<Hospital> getHospitals(@RequestParam String acmAddr) {
		
		List<Hospital> hospitalList = mapService.findHospitalListByAcmAdddr(acmAddr);
		
		return hospitalList;
	}
	
	//Ajax로 가져갈 경찰서 정보
	@RequestMapping("/api/police")
	@ResponseBody
	public List<PoliceStation> getPolice(@RequestParam String acmAddr) {
		
		List<PoliceStation> policeStationList = mapService.findPoliceStationListByAcmAddr(acmAddr);
		
		return policeStationList;
	}

	// 상세페이지에서 정보를 받아 예약페이지로 넘김
	@PostMapping("/roominfo")
	public String roomInfoAction(Reservation reservation, HttpSession session) {

		if (reservation != null) {
			// 몇일 계산(객실금액*총 금액 계산용)
			int totalDate = RoomAmountManager.totalDate(reservation.getRsvtChekInDate(),
					reservation.getRsvtChekOutDate());
			reservation.setTotalNight(totalDate);

			// int값의 숫자를 천단위로 끊어서 금액으로 표시(ex. 80,000)
			NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.KOREA);

			// int 값으로 된 금액들을 String 형태로 변경해서 금액 DTO에 저장
			ReservationAmount rsvtAmount = new ReservationAmount();
			rsvtAmount.setRsvtRoomAmount(numberFormat.format(reservation.getRsvtRoomAmount())); // 객실금액

			// 할인금액 = 총 금액/할인금액
			int discount = 0;

			// 할인금액
			if (reservation.getRsvtDiscount() == 0) {

				// 할인율 0일 때의 금액도 0
				rsvtAmount.setRsvtDiscountAmount("0");

			} else {

				discount = (int) (((reservation.getRsvtPaymentAmount() / reservation.getRsvtDiscount()) / 100.0) * 100);

				String discountAmount = numberFormat.format(discount);

				rsvtAmount.setRsvtRoomAmount(discountAmount);
			}

			int paymentAmount = (int) ((reservation.getRsvtRoomAmount() * reservation.getTotalNight()) - discount);

			reservation.setRsvtPaymentAmount(paymentAmount);

			rsvtAmount.setRsvtPaymentAmount(numberFormat.format(paymentAmount));

			session.setAttribute("reservation", reservation);
			session.setAttribute("rsvtAmount", rsvtAmount);
		}

		if (session.getAttribute("user") == null) {
			return "redirect:/signupMain";
		}

		return "redirect:/reservationpage";
	}

	@GetMapping("/reservationpage")
	public String reservationpage(HttpSession session, Model model) {

		Reservation reservation = null;

		if (session.getAttribute("reservation") != null) {

			// 세션에서 reservationCondition 정보 불러오기
			reservation = (Reservation) session.getAttribute("reservation");

			int acmCode = reservation.getAcmCode();

			// 숙소 사진정보 불러오기
			AccommodationImg acmImg = acmService.findAcmRepImgbyAcmCode(acmCode);

			model.addAttribute("acmImg", acmImg);
		}

		return "customer/reservationpage";
	}

	// 예약페이지 액션
	@PostMapping("/reservationpage")
	public String reservationAction(Reservation reservation, HttpSession session) {

		// 예약 완료되면 예약을 확인하겠냐고 물어보고 예약 상세페이지로 이동
		int result = reservationService.saveReservation(reservation);

		if (result > 0) {
			System.out.println("예약 성공");

			// reservation 업데이트
			session.setAttribute("reservation", reservation);

			return "redirect:/completeReservation";

		} else {
			System.out.println("예약 실패");

			return "redirect:/reservationpage";
		}
	}

	@RequestMapping("/completeReservation")
	public String completeReservation(HttpSession session, Model model) {

		if (session.getAttribute("reservation") != null) {
			Reservation reservation = (Reservation) session.getAttribute("reservation");

			// 업소코드로 대표이미지&업소정보 불러오기
			int acmCode = reservation.getAcmCode();

			AccommodationImg acmImg = acmService.findAcmRepImgbyAcmCode(acmCode);
			model.addAttribute("acmImg", acmImg);

			// 업소정보 불러오기
			Acm acm = acmService.findAcmByAcmCode(acmCode);
			model.addAttribute("acm", acm);
		}

		return "customer/reservationComplete";
	}
}
