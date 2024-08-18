package com.app.dto.admin;

import lombok.Data;

@Data
public class AccommodationDetails {

	int acmCode;	//업소 코드
	String acmDtlIntroduction;	//숙소 소개
	String acmDtlNotice;	//공지사항
	String acmDtlInfo;	//기본정보
	String acmDtlUsageGuide;	//숙소 이용안내
	String acmDtlAddPersonnel;	//인원 추가 정보
	String acmDtlRoomInfo;	//객실 정보
	String acmDtlFacilities; //부대시설 정보
	String acmDtlParking;	//주차장 안내
	String acmDtlTransport;	//대중교통 정보
	String acmDtlBenefit;	//이용 혜택
	String acmDtlSurroundingInfo;	//주변 정보
	String acmDtlGuide;	//추가 안내사항
	String acmDtlPolicy;	//취소 및 환불 규정
	String acmDtlEtc;	//확인사항 및 기타

}
