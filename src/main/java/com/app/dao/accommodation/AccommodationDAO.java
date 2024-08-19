package com.app.dao.accommodation;

import java.util.List;

import com.app.dto.Accommodation.Acm;
import com.app.dto.admin.AccommodationDetails;
import com.app.dto.admin.AccommodationImg;

public interface AccommodationDAO {

	// 업소코드 기반으로 업소 불러오기
	public Acm findAcmByAcmCode(int acmCode);
	
	//업소코드 기반으로 업소 상세정부 불러오기
	public AccommodationDetails findAcmDetailByAcmCode(int acmCode);
	
	//업소코드 기반 업소 사진 리스트 불러오기
	public List<AccommodationImg> findAcmImgListByAcmCode(int acmCode);
	
	//업소코드 기반 업소 대표 사진 불러오기
	public AccommodationImg findAcmRepImgbyAcmCode(int acmCode);
}
