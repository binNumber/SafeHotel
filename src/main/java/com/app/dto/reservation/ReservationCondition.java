package com.app.dto.reservation;

import lombok.Data;

@Data
public class ReservationCondition {
	//예약을 진행하기 위한 DTO
	
	int acmCode;	//업소코드
	int roomCode;	//객실코드
	String rsvtChekInDate;	//체크인날짜+시간
	String rsvtChekOutDate;	//체크아웃날짜+시간
	int rsvtRoomAmount;	//객실 금액
	int user_code;	//유저코드
}
