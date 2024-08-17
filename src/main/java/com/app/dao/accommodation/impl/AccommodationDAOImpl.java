package com.app.dao.accommodation.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.accommodation.AccommodationDAO;
import com.app.dto.admin.Accommodation;
import com.app.dto.admin.AccommodationDetails;
import com.app.dto.admin.AccommodationImg;

@Repository
public class AccommodationDAOImpl implements AccommodationDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	// 업소코드 기반으로 업소 불러오기
	@Override
	public Accommodation findAcmByAcmCode(int acmCode) {
		// TODO Auto-generated method stub
		
		Accommodation acm = sqlSessionTemplate.selectOne("acm_mapper.findAcmByAcmCode", acmCode);
		
		return acm;
	}

	//업소코드 기반으로 업소 상세정부 불러오기
	@Override
	public AccommodationDetails findAcmDetailByAcmCode(int acmCode) {
		// TODO Auto-generated method stub
		
		AccommodationDetails acmDetail = sqlSessionTemplate.selectOne("acm_mapper.findAcmDetailByAcmCode", acmCode);
		
		return acmDetail;
	}

	//업소코드 기반 업소 사진 리스트 불러오기
	@Override
	public List<AccommodationImg> findAcmImgListByAcmCode(int acmCode) {
		// TODO Auto-generated method stub
		
		List<AccommodationImg> acmImgList = sqlSessionTemplate.selectList("acm_mapper.findAcmImgListByAcmCode", acmCode);
		
		return acmImgList;
	}

}
