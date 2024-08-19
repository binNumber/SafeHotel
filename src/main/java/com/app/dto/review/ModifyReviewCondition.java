package com.app.dto.review;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ModifyReviewCondition {

	//리뷰 수정내용 반영하기 위한 DTO
	
	int reviewCode;	//리뷰코드
	String reviewText; //리뷰 텍스트
	
	List<MultipartFile> reviewImgFile;
}
