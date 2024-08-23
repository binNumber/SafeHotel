package com.app.dto.room;

import lombok.Data;

@Data
public class SearchRoomCondition {
	//에약가능한 룸을 찾기 위한 DTO
	
	int acmCode;	//업소코드
	String checkInDate;	//체크인 날짜
	String checkOutDate;	//체크아웃 날짜
	int personnel;	//인원 
	String searchText; // 검색어 파라미터 저장값

}
