package com.app.controller.customer;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.app.dto.admin.Accommodation;
import com.app.dto.admin.AccommodationDetails;
import com.app.dto.admin.AccommodationImg;
import com.app.dto.reservation.ReservationCondition;
import com.app.dto.room.Room;
import com.app.dto.room.SearchRoomCondition;
import com.app.dto.user.User;
import com.app.service.accommodation.AccommodationService;
import com.app.service.room.RoomService;

@Controller
public class AccommodationInfoController {

	@Autowired
	AccommodationService acmService;
	
	@Autowired
	RoomService roomService;
	
	//나중에 코드만 복붙할 예정
	@GetMapping("/roominfo2")
	public String roominfotest(SearchRoomCondition searchRoom,
			Model model) {
		
		//업소코드 임의 설정
		int acmCode = 1;
		
		//업소코드 기반으로 업소 정보 불러오기
		Accommodation acm = acmService.findAcmByAcmCode(acmCode);
		
		if(acm != null) {
			System.out.println(acm.getAcmCode());
			System.out.println(acm.getAcmName());
			System.out.println(acm.getAcmTel());
			System.out.println(acm.getAcmType());
			
			//숙소 정보값 페이지에 전달
			model.addAttribute("acm", acm);
		}
		
		//업소 코드 기반으로 숙소 세부정보 불러오기
		AccommodationDetails acmDetail = acmService.findAcmDetailByAcmCode(acmCode);
		
		if(acmDetail != null) {
			System.out.println(acmDetail.getAcmCode());
			System.out.println(acmDetail.getAcmDtlPolicy());
			
			model.addAttribute("acmDetail", acmDetail);
		}
		
		//업소 코드 기반으로 숙소 사진리스트 불러오기
		List<AccommodationImg> acmImgList = acmService.findAcmImgListByAcmCode(acmCode);
		
		
		
		//업소코드, 체크인 날짜, 체크아웃 날짜, 인원수 기반으로 객실 정보 불러오기
		List<Room> roomList = roomService.findRoomListBySearchRoomCondtion(searchRoom);
		//mapper에서 쿼리문 작성 후 적용만 하면 됨
		
		return "customer/roominfo";
	}
	
	//상세페이지에서 정보를 받아 예약페이지로 넘김
	@PostMapping("/roominfo2")
	public String roomInfoAction(ReservationCondition reservationCondition,
			HttpSession session) {
		
		//로그인 페이지로 이동할 수도 있어서 세션으로 값 보내기
		session.setAttribute("reservationCondition", reservationCondition);
			
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
	public String reservationAction() {
		
		//예약 완료되면 예약을 확인하겠냐고 물어보고 예약 상세페이지로 이동
		
		return "";
	}
	
}