package com.app.dto.admin;

import lombok.Data;

@Data
public class AccommodationImg {

	int accImgCode;	//업소 이미지 코드
	int acmCode;	//업소 코드
	int roomCode;	//객실 코드
	String accImgOriginName;	//사진 원래 이름
	String accImgSaveName;	//사진 저장 이름
	String accImgExtension;	//확장자명
	String accImgUrl;	//이미지 Url
}
