package com.app.dao.search.impl;

import java.util.ArrayList;
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
			result.add(accommodationInfo);
		}

		return result;
	}

}
