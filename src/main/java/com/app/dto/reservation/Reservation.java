package com.app.dto.reservation;

import lombok.Data;

@Data
public class Reservation {
	
	//예약 기본 코드
	String rsvtCode;	//예약 코드
	int acmCode;	//숙소 코드(숙소 정보 불러오기 위함)
	int roomCode;	//객실 코드(객실 정보 불러오기 위함)
	String checkInDate;	//체크인 날짜
    String checkOutDate;	//체크아웃 날짜
    int totalNight;	//몇박
    int totalDays;	//몇일
	int rsvtDiscount;	//할인정보
	String rsvtPaymentInfo;	//결제정보(결제를 무엇으로 했는지)
	int rsvtPaymentAmount;	//결제 금액
	int userCode;	//예약자 유저 코드
	String guestName;	//예약자 이름(예약하는 유저와 실제 예약자가 다른 경우 상정)
	String guestTel;	//예약자 전화번호(예약하는 유저와 실제 예약자가 다른 경우 상정)
	int rsvtStatus;	//예약상태 : 0-'승인 전' 1-'승인' 2-'취소' 3-'이용완료'
	
	//숙소 테이블에서 가져온 정보
	String acmNmae;	//숙소 이름
	
	//룸 테이블에서 가져온 정보
	String roomName;	//객실 이름
	
	//숙소 이미지 정보
	int imgCode;	//숙소 이미지 코드
    String imgOriginName;	//이미지 원래 이름
    String imgSaveName;		//저장명
    String imgExtension;	//확장명
    String imgUrl;	//이미지 저장 위치
}
