package com.app.service.accommodation.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.accommodation.AccommodationDAO;
import com.app.dto.Accommodation.Acm;
import com.app.dto.admin.AccommodationDetails;
import com.app.dto.admin.AccommodationImg;
import com.app.service.accommodation.AccommodationService;

@Service
public class AccommodationServiceImpl implements AccommodationService {

	@Autowired
	AccommodationDAO acmDAO;
	
	//업소코드 기반으로 업소 불러오기
	@Override
	public Acm findAcmByAcmCode(int acmCode) {
		// TODO Auto-generated method stub
		Acm acm = acmDAO.findAcmByAcmCode(acmCode);
		
		return acm;
	}

	//업소코드 기반으로 업소 상세정부 불러오기
	@Override
	public AccommodationDetails findAcmDetailByAcmCode(int acmCode) {
		// TODO Auto-generated method stub
		
		AccommodationDetails acmDetail = acmDAO.findAcmDetailByAcmCode(acmCode);
		
		return acmDetail;
	}

	//업소코드 기반 업소 사진 리스트 불러오기
	@Override
	public List<AccommodationImg> findAcmImgListByAcmCode(int acmCode) {
		// TODO Auto-generated method stub
		
		List<AccommodationImg> acmImgList = acmDAO.findAcmImgListByAcmCode(acmCode);
		
		return acmImgList;
	}

	//업소코드 기반 업소 대표 사진 불러오기
	@Override
	public AccommodationImg findAcmRepImgbyAcmCode(int acmCode) {
		// TODO Auto-generated method stub
		
		AccommodationImg acmRepImg = acmDAO.findAcmRepImgbyAcmCode(acmCode);
		
		return acmRepImg;
	}

}
