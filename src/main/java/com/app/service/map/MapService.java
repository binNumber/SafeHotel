package com.app.service.map;

import java.util.List;

import com.app.dto.map.Hospital;
import com.app.dto.map.PoliceStation;

public interface MapService {
	
	//해당 주소지의 병원 리스트 불러오기
	public List<Hospital> findHospitalListByAcmAdddr(String acmAddr);
	
	//해당 주소지의 경찰서 리스트 불러오기
	public List<PoliceStation> findPoliceStationListByAcmAddr(String acmAddr);
	
	//업소코드 기반으로 업소의 주소정보 가져오기(근처 병원/경찰서 위치 가져오기 위함)
	public String findAcmAddrByAcmCode(int acmCode);
}
