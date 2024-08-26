package com.app.dao.map.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.map.MapDAO;
import com.app.dto.map.Hospital;
import com.app.dto.map.PoliceStation;

@Repository
public class MapDAOImpl implements	MapDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	//해당 주소지의 병원 리스트 불러오기
	@Override
	public List<Hospital> findHospitalListByAcmAdddr(String acmAddr) {
		// TODO Auto-generated method stub
		
		List<Hospital> hList = sqlSessionTemplate.selectList("map_mapper.findHospitalListByAcmAdddr", acmAddr);
		
		return hList;
	}

	//해당 주소지의 경찰서 리스트 불러오기
	@Override
	public List<PoliceStation> findPoliceStationListByAcmAddr(String acmAddr) {
		// TODO Auto-generated method stub
		
		List<PoliceStation> psList = sqlSessionTemplate.selectList("map_mapper.findPoliceStationListByAcmAddr", acmAddr);
		
		return psList;
	}
	
	//업소코드 기반으로 업소의 주소정보 가져오기(근처 병원/경찰서 위치 가져오기 위함)
	@Override
	public String findAcmAddrByAcmCode(int acmCode) {
		// TODO Auto-generated method stub
		
		String acmAddr = sqlSessionTemplate.selectOne("map_mapper.findAcmAddrByAcmCode", acmCode);
		
		return acmAddr;
	}
}
