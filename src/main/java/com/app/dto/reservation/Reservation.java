package com.app.dto.reservation;

public class Reservation {
	int rsvtCode;	//예약 코드
	int acmCode;	//숙소 코드(숙소 정보 불러오기 위함)
	int roomCode;	//객실 코드(객실 정보 불러오기 위함)
	String rsvtDate;	//예약날짜
	int rsvtDiscount;	//할인정보
	String rsvtPaymentInfo;	//결제정보(결제를 무엇으로 했는지)
	int rsvtPaymentAmount;	//결제 금액
	int userCode;	//예약자 유저 코드
	String guestName;	//예약자 이름(예약하는 유저와 실제 예약자가 다른 경우 상정)
	String guestTel;	//예약자 전화번호(예약하는 유저와 실제 예약자가 다른 경우 상정)
	String rsvtStatus;	//예약상태 : 0-'승인 전' 1-'승인' 2-'취소' 3-'이용완료'
}
