package com.app.dto.reservation;

import lombok.Data;

@Data
public class ReservationGuestInfo {

	String rsvtCode;	//예약번호
	String guestName;	//예약자 이름
	String guestTel;	//예약자 번호
}
