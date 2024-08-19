package com.app.controller.search;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.main.ReceiveData;
import com.app.dto.main.SearchText;
import com.app.service.search.SearchService;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;

	@GetMapping("/search/listpage")
	public String search(@RequestParam String searchText, @RequestParam Date checkIn, @RequestParam Date checkOut,
			@RequestParam int people, Model model) {

		// 검색 텍스트를 기반으로 데이터 가져오기
		List<ReceiveData> accommodations = searchService.searchAccommodations(searchText);

		// 모델에 데이터 추가
		model.addAttribute("search", new SearchText(searchText, checkIn, checkOut, people));
		model.addAttribute("accommodations", accommodations);

		// 검색 결과의 개수를 모델에 추가
		model.addAttribute("accommodationCount", accommodations.size());

		return "customer/listpage"; // 리스트 페이지로 이동
	}
}
