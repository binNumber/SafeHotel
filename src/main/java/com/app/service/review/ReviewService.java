package com.app.service.review;

import java.util.List;

import com.app.dto.review.Review;
import com.app.dto.review.ReviewImg;

public interface ReviewService {
	
	//유저코드 기반으로 리뷰 리스트 불러오기
	public List<Review> findReviewListByUserCode(int userCode);
	
	//리뷰코드 기반으로 이미지 리스트 불러오기
	public List<ReviewImg> findReviewImgListByReviewCode(int reviewCode);

	//예약코드 기반으로 이미지 리스트 불러오기
	public List<ReviewImg> findReviewImgListByRsvtCode(String rsvtCode);
}
