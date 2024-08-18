package com.app.dao.review;

import java.util.List;

import com.app.dto.review.Review;
import com.app.dto.review.ReviewImg;

public interface ReviewDAO {
	
	//유저코드 기반으로 리뷰 리스트 불러오기
	public List<Review> findReviewListByUserCode(int userCode);
	
	//리뷰코드 기반으로 이미지 리스트 불러오기
	public List<ReviewImg> findReviewImgListByReviewCode(int reviewCode); 

	//예약코드 기반으로 이미지 리스트 불러오기
	public List<ReviewImg> findReviewImgListByRsvtCode(String rsvtCode);
	
	//다음 리뷰 코드 불러오기(리뷰코드 생성)
	public int getNextReviewCode();
	
	//다음 리뷰 이미지 코드 불러오기(리뷰 이미지 코드 생성)
	public int getNextReviewImgCode();
	
	//유저 리뷰 DB에 저장
	public int saveUserReview(Review review);
	
	//리뷰 이미지 DB에 저장
	public int saveReviewImg(ReviewImg reviewImg);
	
	//리뷰 삭제
	public int deleteReview(int reviewCode);
	
	//업소코드 기반으로 리뷰 리스트 불러오기
	public List<Review> findReviewListByAcmCode(int acmCode);
}
