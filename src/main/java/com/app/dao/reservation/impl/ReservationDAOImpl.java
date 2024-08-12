package com.app.dao.reservation.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.reservation.ReservationDAO;
import com.app.dto.reservation.Reservation;

@Repository
public class ReservationDAOImpl implements ReservationDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//유저코드 기반으로 예약리스트 불러오기
	@Override
	public List<Reservation> findReservationListByUserCode(int userCode) {
		// TODO Auto-generated method stub
		List<Reservation> reservationList = sqlSessionTemplate.selectList("reservation_mapper.findReservationListByUserCode", userCode);
		
		return reservationList;
	}

	//예약코드 기반으로 예약 정보 확인 후 예약상태 예약취소로 변경
	@Override
	public int updateRsvtStatusByRsvtCode(String rsvtCode) {
		// TODO Auto-generated method stub

		int result = sqlSessionTemplate.update("reservation_mapper.updateRsvtStatusByRsvtCode", rsvtCode);
		
		return result;
	}

	
}
