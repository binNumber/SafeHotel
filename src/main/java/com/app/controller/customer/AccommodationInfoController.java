package com.app.controller.customer;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.app.dto.Accommodation.Acm;
import com.app.dto.admin.AccommodationDetails;
import com.app.dto.admin.AccommodationImg;
import com.app.dto.reservation.Reservation;
import com.app.dto.reservation.ReservationCondition;
import com.app.dto.review.Review;
import com.app.dto.review.ReviewImg;
import com.app.dto.room.Room;
import com.app.dto.room.SearchRoomCondition;
import com.app.dto.user.User;
import com.app.service.accommodation.AccommodationService;
import com.app.service.reservation.ReservationService;
import com.app.service.review.ReviewService;
import com.app.service.room.RoomService;
import com.app.utiil.RoomAmountManager;

@Controller
public class AccommodationInfoController {

	@Autowired
	AccommodationService acmService;
	
	@Autowired
	RoomService roomService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	ReservationService reservationService;
	
	//나중에 코드만 복붙할 예정
	@GetMapping("/roominfo2")
	public String roominfotest(//SearchRoomCondition searchRoom,
			Model model) {
		
		SearchRoomCondition searchRoom = new SearchRoomCondition();
		
		//임의 값 설정
		searchRoom.setAcmCode(18);
		searchRoom.setCheckInDate("2024/08/30");
		searchRoom.setCheckOutDate("2024/08/31");
		searchRoom.setPersonnel(3);
		
		
		model.addAttribute("searchRoom", searchRoom);
		
		int acmCode = searchRoom.getAcmCode();
		
		//업소코드 기반으로 업소 정보 불러오기
		Acm acm = acmService.findAcmByAcmCode(acmCode);
		
		if(acm != null) {

			//숙소 정보값 페이지에 전달
			model.addAttribute("acm", acm);
		}
		
		//업소 코드 기반으로 숙소 세부정보 불러오기
		AccommodationDetails acmDetail = acmService.findAcmDetailByAcmCode(acmCode);
		
		if(acmDetail != null) {
			
			//%%로 저장된 내용 enter로 변경
			if(acmDetail.getAcmDtlIntroduction() != null)
				acmDetail.setAcmDtlIntroduction(acmDetail.getAcmDtlIntroduction().replace("%%", "<br>"));
			if(acmDetail.getAcmDtlNotice() != null)
				acmDetail.setAcmDtlNotice(acmDetail.getAcmDtlNotice().replace("%%", "<br>"));
			if(acmDetail.getAcmDtlInfo() != null)
				acmDetail.setAcmDtlInfo(acmDetail.getAcmDtlInfo().replace("%%", "<br>"));
			if(acmDetail.getAcmDtlUsageGuide() != null)
				acmDetail.setAcmDtlUsageGuide(acmDetail.getAcmDtlUsageGuide().replace("%%", "<br>"));
			if(acmDetail.getAcmDtlAddPersonnel() != null)
				acmDetail.setAcmDtlAddPersonnel(acmDetail.getAcmDtlAddPersonnel().replace("%%", "<br>"));
			if(acmDetail.getAcmDtlRoomInfo() != null)
				acmDetail.setAcmDtlRoomInfo(acmDetail.getAcmDtlRoomInfo().replace("%%", "<br>"));
			if(acmDetail.getAcmDtlFacilities() != null)
				acmDetail.setAcmDtlFacilities(acmDetail.getAcmDtlFacilities().replace("%%", "<br>"));
			if(acmDetail.getAcmDtlParking() != null)
				acmDetail.setAcmDtlParking(acmDetail.getAcmDtlParking().replace("%%", "<br>"));
			if(acmDetail.getAcmDtlTransport() != null)
				acmDetail.setAcmDtlTransport(acmDetail.getAcmDtlTransport().replace("%%", "<br>"));
			if(acmDetail.getAcmDtlBenefit() != null)
				acmDetail.setAcmDtlBenefit(acmDetail.getAcmDtlBenefit().replace("%%", "<br>"));
			if(acmDetail.getAcmDtlSurroundingInfo() != null)
				acmDetail.setAcmDtlSurroundingInfo(acmDetail.getAcmDtlSurroundingInfo().replace("%%", "<br>"));
			if(acmDetail.getAcmDtlGuide() != null)
				acmDetail.setAcmDtlGuide(acmDetail.getAcmDtlGuide().replace("%%", "<br>"));
			if(acmDetail.getAcmDtlPolicy() != null)
				acmDetail.setAcmDtlPolicy(acmDetail.getAcmDtlPolicy().replace("%%", "<br>"));
			if(acmDetail.getAcmDtlEtc() != null)
				acmDetail.setAcmDtlEtc(acmDetail.getAcmDtlEtc().replace("%%", "<br>"));
			
			System.out.println(acmDetail.getAcmCode());
			System.out.println(acmDetail.getAcmDtlPolicy());
			
			model.addAttribute("acmDetail", acmDetail);
		}
		
		//업소 코드 기반으로 숙소 대표 사진 불러오기
		AccommodationImg acmRepImg = acmService.findAcmRepImgbyAcmCode(acmCode);
		
		model.addAttribute("acmRepImg", acmRepImg);
		
		
		//업소 코드 기반으로 숙소 사진리스트 불러오기
		List<AccommodationImg> acmImgList = acmService.findAcmImgListByAcmCode(acmCode);
		
		if(acmImgList != null) {
			
			model.addAttribute("acmImgList", acmImgList);
			
		}
		
		//업소코드, 체크인 날짜, 체크아웃 날짜, 인원수 기반으로 객실 정보 불러오기
		List<Room> roomList = roomService.findRoomListBySearchRoomCondtion(searchRoom);
		//mapper에서 쿼리문 작성 후 적용만 하면 됨
		
		if(roomList != null) {
			
			for(Room r : roomList) {
				
				r.setRoomAmount(RoomAmountManager.determinePrice(searchRoom, r));
				r.setRoomAmountStr(RoomAmountManager.getRoomAmount(searchRoom, r));
				
				System.out.println("이용가능한 룸 개수");
				System.out.println(r.getRoomName());
				System.out.println(r.getAvailableRooms());
				System.out.println(r.getCheckInTime());
				System.out.println(r.getCheckOutTime());
								
				List<AccommodationImg> roomImgList = null;
				for(AccommodationImg acmImg : acmImgList) {
					if(r.getRoomCode() == acmImg.getRoomCode()) {
						
						roomImgList = new ArrayList<AccommodationImg>();
						
						//객실 코드가 일치하는 경우만 List에 추가
						roomImgList.add(acmImg);
					}
				}
				
				if(roomImgList != null) {
					//Room 객체에 roomImgList 추가
					r.setRoomImgList(roomImgList);
					r.setRoomRepImg(r.getRoomImgList().get(0));	
				}
			}
		}
		
		model.addAttribute("roomList", roomList);
		
		
		//업소 코드 기반으로 리뷰 불러오기
		List<Review> reviewList = reviewService.findReviewListByAcmCode(acmCode);
		
		int reviewCount = 0;
		int reviewTotalRating = 0;
		String reviewRatingAverageStr = null;
		
		if(reviewList != null) {
			for(Review rv : reviewList) {
				reviewCount++;
				reviewTotalRating += rv.getRating();
				
				int reviewCode = rv.getReviewCode();
				
				//리뷰 코드 기반으로 리뷰 이미지 리스트 불러오기
				List<ReviewImg> reviewImg = reviewService.findReviewImgListByReviewCode(reviewCode);
				
				rv.setReviewImgList(reviewImg);
			}
		}
		
		if(reviewCount != 0 && reviewTotalRating != 0) {
			double doreviewRatingAverage = (double)reviewTotalRating/reviewCount;
			reviewRatingAverageStr = Double.toString(doreviewRatingAverage);
		}
		
		model.addAttribute("reviewLisy", reviewList);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("reviewRatingAverageStr", reviewRatingAverageStr);
		
		return "customer/roominfo";
	}
	
	//상세페이지에서 정보를 받아 예약페이지로 넘김
	@PostMapping("/roominfo2")
	public String roomInfoAction(ReservationCondition reservationCondition,
			HttpSession session) {
		
		System.out.println("예약 폼 확인");
		System.out.println(reservationCondition.getAcmCode());
		System.out.println(reservationCondition.getAcmName());
		System.out.println(reservationCondition.getRsvtChekInDate());
		System.out.println(reservationCondition.getRsvtChekOutDate());
		System.out.println(reservationCondition.getRoomCode());
		System.out.println(reservationCondition.getRoomName());
		
		//로그인 페이지로 이동할 수도 있어서 세션으로 값 보내기
		session.setAttribute("reservationCondition", reservationCondition);
		
		if(session.getAttribute("user") == null) {
			return "redirect:/signupMain";
		}
		
		return "redirect:/reservationpage2";
	}
	
	//예약 페이지
	@GetMapping("/reservationpage2")
	public String reservationpage(HttpSession session) {
		
		//세션에 유저정보 + reservationCondition 값 받아오기
		//(jsp 파일에서 자체적으로 가져오기)
		
		return "customer/reservationpage";
	}
	
	//예약페이지 액션
	@PostMapping("/reservationpage2")
	public String reservationAction(Reservation reservation,
			HttpSession session) {
		
		//예약 완료되면 예약을 확인하겠냐고 물어보고 예약 상세페이지로 이동
		int result = reservationService.saveReservation(reservation);
		
		if(result > 0) {
			System.out.println("예약 성공");
			
			session.setAttribute("isCheckPw", "OK");
			
			return "redirect:/mypage/checkReservation/confirmed";
			
		} else {
			System.out.println("예약 실패");
		}
		
		return "redirect:/reservationpage2";
	}
	
}