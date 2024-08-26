package com.app.service.map.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.accommodation.AccommodationDAO;
import com.app.dao.map.MapDAO;
import com.app.dto.map.Hospital;
import com.app.dto.map.PoliceStation;
import com.app.service.map.MapService;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired
	MapDAO mapDAO;

	//해당 주소지의 병원 리스트 불러오기
	@Override
	public List<Hospital> findHospitalListByAcmAdddr(String acmAddr) {
		// TODO Auto-generated method stub
		
		List<Hospital> hList = mapDAO.findHospitalListByAcmAdddr(acmAddr);
		
		return hList;
	}

	//해당 주소지의 경찰서 리스트 불러오기
	@Override
	public List<PoliceStation> findPoliceStationListByAcmAddr(String acmAddr) {
		// TODO Auto-generated method stub
		
		List<PoliceStation> psList = mapDAO.findPoliceStationListByAcmAddr(acmAddr);
		
		return psList;
	}
	
	//업소코드 기반으로 업소의 주소정보 가져오기(근처 병원/경찰서 위치 가져오기 위함)
	@Override
	public String findAcmAddrByAcmCode(int acmCode) {
		// TODO Auto-generated method stub
		
		String acmAddr = mapDAO.findAcmAddrByAcmCode(acmCode);
		
		return acmAddr;
	}
}
