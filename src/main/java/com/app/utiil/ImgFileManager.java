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
		reviewImg.setReviewImgUrl("/fileStorage/image/review_img/" + review.getUserCode() + "/" + review.getRsvtCode());


		//실제 파일 저장 ex) D:/whs-workspace/safeHotel-project/SafeHotel/src/main/webapp/resources/img/review_img/1/20240814-00003
		imgFile.transferTo(new File(FILE_DIRECTORY_PATH + "review_img/" + review.getUserCode() + "/" + review.getRsvtCode() + "/" + reviewImg.getReviewImgSaveName() + reviewImg.getReviewImgExtension()));

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

	//리뷰 이미지 삭제
	public static boolean removeFile(Review review, ReviewImg reviewImg) {
		
		System.out.println(FILE_DIRECTORY_PATH + "review_img/" + review.getUserCode() + "/" + review.getRsvtCode() + "/" + reviewImg.getReviewImgSaveName() + reviewImg.getReviewImgExtension());
		
		File file = new File(FILE_DIRECTORY_PATH + "review_img/" + review.getUserCode() + "/" + review.getRsvtCode() + "/" + reviewImg.getReviewImgSaveName() + reviewImg.getReviewImgExtension());
		
		if (file.exists()) {
			
			return file.delete(); // 파일 삭제 시 성공 여부를 반환
			
		}

		return false; // 파일이 존재하지 않으면 false 반환 } }
	}
}