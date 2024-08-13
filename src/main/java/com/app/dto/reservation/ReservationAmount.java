package com.app.dto.reservation;

import lombok.Data;

@Data
public class ReservationAmount {

	//int값으로 금액을 String *.***원 형태로 바꾸기 위한 DTO
	
	String rsvtRoomAmount;	//객실금액
	String rsvtDiscountAmount;	//할인금액
	String rsvtPaymentAmount;	//총 결제금액
	
}
