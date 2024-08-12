package com.app.service.reservation.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.reservation.ReservationDAO;
import com.app.dto.reservation.Reservation;
import com.app.service.reservation.ReservationService;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	ReservationDAO reservationDAO;
	
	//유저코드 기반으로 예약리스트 불러오기
	@Override
	public List<Reservation> findReservationListByUseCode(int userCode) {
		// TODO Auto-generated method stub
		
		List<Reservation> reserveList = reservationDAO.findReservationListByUserCode(userCode);
		
		return reserveList;
	}

	//예약코드 기반으로 예약 정보 확인 후 예약상태 예약취소로 변경
	@Override
	public int updateRsvtStatusByRsvtCode(String rsvtCode) {
		// TODO Auto-generated method stub
		
		int result = reservationDAO.updateRsvtStatusByRsvtCode(rsvtCode);
		
		return result;
	}

}
