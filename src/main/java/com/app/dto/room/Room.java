package com.app.dto.room;

import java.util.List;

import com.app.dto.admin.AccommodationImg;

import lombok.Data;

@Data
public class Room {

	int roomCode; //객실 코드
	int acmCode;	//업소 코드
	String roomName;	//객실 이름
	String roomType;	//객실 타입
	int totalRooms;	//객실개수
	int availableRooms;	//이용 가능한 객실 개수
	String checkInTime;	//체크인 시간
	String checkOutTime;	//체크아웃 시간
	int roomCapacity;	//기준인원
	int roomMaxCapacity;	//최대인원
	int roomWeekdayPrice;	//주중 금액
	int roomWeekendPrice;	//주말 금액
	int peakSeasonWeekdayPrice;	//성수기 주중 금액
	int peakSeasonWeekendPrice;	//성수기 주말 금액
	String RoomInfo;	//룸 정보
	String roomAmenities;	//객실 편의시설
	String roomStatus;	//객실 운영 상태 0:운영X 1:운영
	
	List<AccommodationImg> roomImgList;	//객실 이미지
	
	AccommodationImg roomRepImg;	//대표이미지
	
	int roomAmount;	//객실 금액
	String roomAmountStr; //금액을 1,000단위로 끊어서 표시하기 위한 변수
}
