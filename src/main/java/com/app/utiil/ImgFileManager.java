package com.app.utiil;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.app.dto.review.Review;
import com.app.dto.review.ReviewImg;

public class ImgFileManager {
	
	//파일 저장할 폴더 위치
	private static final String FILE_DIRECTORY_PATH = "d:/fileStorage/image/";
	
	
	//리뷰 이미지 저장 및 ReviewImg에 정보 저장
	public static ReviewImg saveFile(MultipartFile imgFile, Review review) throws IllegalStateException, IOException {

		ReviewImg reviewImg = new ReviewImg();
		
		reviewImg.setReviewCode(review.getReviewCode());
		reviewImg.setReviewImgOriginName(imgFile.getOriginalFilename());
		reviewImg.setReviewImgSaveName(createSaveName());
		reviewImg.setReviewImgExtension(extractExtension(reviewImg.getReviewImgOriginName()));
		//리뷰코드 저장 url		ex)	/review_img/1/20240814-00003
		reviewImg.setReviewImgUrl(FILE_DIRECTORY_PATH + "review_img/" + review.getUserCode() + "/" + review.getRsvtCode());
		
		//실제 파일 저장 ex) D:/whs-workspace/safeHotel-project/SafeHotel/src/main/webapp/resources/img/review_img/1/20240814-00003
		imgFile.transferTo(new File(reviewImg.getReviewImgUrl() + "/" + reviewImg.getReviewImgSaveName() + reviewImg.getReviewImgExtension()));
		
		return reviewImg;
	}
	
	//리뷰 이미지 저장 이름 생성
	public static String createSaveName() {
		
		String saveName = UUID.randomUUID().toString();

		return saveName;
	}
	
	//리뷰 이미지 확장자 뽑아오기
	public static String extractExtension(String imgFileName) {
		
		//확장자 위치 찾기
		int dotIndex = imgFileName.lastIndexOf(".");
		
		String extension = imgFileName.substring(dotIndex);
		//.jpg .jpeg ...
		
		return extension;
	}
	
	
}
