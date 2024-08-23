package com.app.dao.search.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.search.SearchDAO;
import com.app.dto.main.ReceiveData;

@Repository
public class SearchDAOImpl implements SearchDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	private static final String Namespace = "main_mapper";

	@Override
	public List<ReceiveData> searchAccommodations(String searchText) {
		// 먼저 acm_code들을 가져옵니다.
		List<String> acmCodes = sqlSessionTemplate.selectList(Namespace + ".getAccommodationCodes",
				"%" + searchText + "%");

		// 각각의 acm_code에 대해 데이터를 가져옵니다.
		List<ReceiveData> result = new ArrayList<>();
		for (String acmCode : acmCodes) {
			// 숙소 정보를 가져옵니다.
			ReceiveData accommodationInfo = sqlSessionTemplate.selectOne(Namespace + ".getAccommodationInfo", acmCode);
			// 이미지 정보를 가져옵니다.
			List<ReceiveData> images = sqlSessionTemplate.selectList(Namespace + ".getAccommodationImages", acmCode);
			if (!images.isEmpty()) {
				// 첫 번째 이미지만 추가 (다른 방법으로 모든 이미지를 처리할 수도 있습니다)
				ReceiveData image = images.get(0);
				accommodationInfo.setAccImgUrl(image.getAccImgUrl());
				accommodationInfo.setAccImgSaveName(image.getAccImgSaveName());
				accommodationInfo.setAccImgExtension(image.getAccImgExtension());
			}
			// 주중/주말에 따른 최저 가격 가져오기
			int minPrice;
			if (isWeekend(accommodationInfo.getCheckIn())) { // 주말인지 판단하는 메서드
				minPrice = sqlSessionTemplate.selectOne(Namespace + ".getWeekendMinPrice", acmCode);
			} else {
				minPrice = sqlSessionTemplate.selectOne(Namespace + ".getWeekdayMinPrice", acmCode);
			}
			accommodationInfo.setMinPrice(minPrice);
			result.add(accommodationInfo);
		}

		return result;
	}

	private boolean isWeekend(Date date) { // Date 타입의 파라미터 사용
		// Date 객체를 이용해 요일 판단 (토요일이나 일요일이면 주말로 처리)
		// Date 값 확인
		if (date == null) {
			return false; // 또는 기본 값을 반환할 수 있음
		}
		System.out.println("Date to check: " + date);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
		return (dayOfWeek == Calendar.SATURDAY || dayOfWeek == Calendar.SUNDAY);
	}
}
