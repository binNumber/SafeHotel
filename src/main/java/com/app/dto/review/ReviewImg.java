package com.app.dto.review;

import java.util.List;

import lombok.Data;

@Data
public class ReviewImg {
	int reviewImgCode;	//이미지 코드
	int reviewCode;		//리뷰 코드
	String reviewImgOriginName;	//이미지원래이름
	String reviewImgSaveName;	//이미지저장이름
	String reviewImgExtension;	//확장자
	String reviewImgUrl;	//이미지 폴더 링크
}
