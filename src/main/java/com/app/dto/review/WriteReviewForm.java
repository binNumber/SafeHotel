package com.app.dto.review;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class WriteReviewForm {
	//리뷰작성 폼에서 전달되는 내용을 저장할 DT
	
	//리뷰 관련
	String rsvtCode;	//예약 코드
	int userCode;	//유저코드
	int acmCode;	//업소코드
	int roomCode;	//객실코드
	int rating;		//평점
	String reviewText;	//리뷰 내용
	
	//리뷰 이미지 관련
	List<MultipartFile> reviewImgFile; //저장할 이미지 파일
}
