package com.app.controller.search;

import java.sql.Date;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.main.ReceiveData;
import com.app.dto.main.SearchText;
import com.app.dto.room.Room;
import com.app.dto.room.SearchRoomCondition;
import com.app.service.room.RoomService;
import com.app.service.search.SearchService;
import com.app.utiil.RoomAmountManager;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;
	
	@Autowired
	RoomService roomService;

	@GetMapping("/search/listpage")
	public String search(@RequestParam String searchText, @RequestParam Date checkIn,
			@RequestParam Date checkOut, @RequestParam int people, Model model) {

		String checkIngStr = checkIn + "";
		String checkOutStr = checkOut + "";
		
		SearchRoomCondition searchRoom = new SearchRoomCondition();
		searchRoom.setCheckInDate(checkIngStr);
		searchRoom.setCheckOutDate(checkOutStr);
		searchRoom.setPersonnel(people);
		searchRoom.setSearchText(searchText);
		model.addAttribute("searchRoom", searchRoom);

		// 로그 출력으로 Date 값 확인
		System.out.println("Check-in Date: " + checkIn);
		System.out.println("Check-out Date: " + checkOut);

		// 검색 텍스트를 기반으로 데이터 가져오기
		List<ReceiveData> accommodations = searchService.searchAccommodations(searchText);
		
		for(ReceiveData rd : accommodations) {
			// 검색 결과의 각 객체에 checkIn 값을 설정
			rd.setCheckIn(checkIn);
			
			//업소코드
			int acmCode = Integer.parseInt(rd.getAcmCode());
			rd.setAcmCodeInt(acmCode);
			
			List<Room> roomList = roomService.findRoomListByAcmCode(acmCode);
			
			for(Room r : roomList) {
				//룸 표시 금액 저장
				r.setRoomAmount(RoomAmountManager.determinePrice(searchRoom, r));
			}
			
			int usageAmount = roomList.get(0).getRoomAmount();
			
			for(Room r : roomList) {
				if(usageAmount > r.getRoomAmount()) {
					usageAmount = r.getRoomAmount();
				}
			}
			
			rd.setUsageAmount(usageAmount);
			
			NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.KOREA);
			rd.setUsageAmountStr(numberFormat.format(rd.getMinPrice()));
		}

		// 모델에 데이터 추가
		model.addAttribute("search", new SearchText(searchText, checkIn, checkOut, people));
		model.addAttribute("accommodations", accommodations);

		// 검색 결과의 개수를 모델에 추가
		model.addAttribute("accommodationCount", accommodations.size());

		return "customer/listpage"; // 리스트 페이지로 이동
	}
}
