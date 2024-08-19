package com.app.service.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.review.ReviewDAO;
import com.app.dto.review.ModifyReviewCondition;
import com.app.dto.review.Review;
import com.app.dto.review.ReviewImg;
import com.app.service.review.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO reviewDAO;
	
	//유저코드 기반으로 리뷰 리스트 불러오기
	@Override
	public List<Review> findReviewListByUserCode(int userCode) {
		// TODO Auto-generated method stub
		
		List<Review> reviewList = reviewDAO.findReviewListByUserCode(userCode);
		
		return reviewList;
	}

	//리뷰코드 기반으로 이미지 리스트 불러오기
	@Override
	public List<ReviewImg> findReviewImgListByReviewCode(int reviewCode) {
		// TODO Auto-generated method stub
		
		List<ReviewImg> rvImgList = reviewDAO.findReviewImgListByReviewCode(reviewCode);
		
		return rvImgList;
	}

	//예약코드 기반으로 이미지 리스트 불러오기
	@Override
	public List<ReviewImg> findReviewImgListByRsvtCode(String rsvtCode) {
		// TODO Auto-generated method stub

		List<ReviewImg> rvImgList = reviewDAO.findReviewImgListByRsvtCode(rsvtCode);
		
		return rvImgList;
	}

	//다음 리뷰 코드 불러오기(리뷰코드 생성)
	@Override
	public int getNextReviewCode() {
		// TODO Auto-generated method stub
		
		int reviewCode = reviewDAO.getNextReviewCode();
		
		return reviewCode;
	}

	//다음 리뷰 이미지 코드 불러오기(리뷰 이미지 코드 생성)
	@Override
	public int getNextReviewImgCode() {
		// TODO Auto-generated method stub
	
		int reviewImgCode = reviewDAO.getNextReviewImgCode();
		
		return reviewImgCode;
	}

	//유저 리뷰 DB에 저장
	@Override
	public int saveUserReview(Review review) {
		// TODO Auto-generated method stub
		
		int result = reviewDAO.saveUserReview(review);
		
		return result;
	}

	//리뷰 이미지 DB에 저장
	@Override
	public int saveReviewImg(ReviewImg reviewImg) {
		// TODO Auto-generated method stub
		int result = reviewDAO.saveReviewImg(reviewImg);
		
		return result;
	}

	//리뷰 코드 기반으로 리뷰 검색
	@Override
	public Review findReviewByReviewCode(int reviewCode) {
		// TODO Auto-generated method stub
		
		Review review = reviewDAO.findReviewByReviewCode(reviewCode);
		
		return review;
	}

	//리뷰 수정
	@Override
	public int modifyReivew(ModifyReviewCondition modifyReview) {
		// TODO Auto-generated method stub
		
		int result = reviewDAO.modifyReivew(modifyReview);
		
		return result;
	}

	//리뷰 삭제
	@Override
	public int deleteReview(int reviewCode) {
		// TODO Auto-generated method stub
		
		int result = reviewDAO.deleteReview(reviewCode);
		
		return result;
	}

	//업소코드 기반으로 리뷰 리스트 불러오기
	@Override
	public List<Review> findReviewListByAcmCode(int acmCode) {
		// TODO Auto-generated method stub
		
		List<Review> reviewList = reviewDAO.findReviewListByAcmCode(acmCode);
		
		return reviewList;
	}

	//리뷰 코드 기반으로 리뷰 이미지 삭제
	@Override
	public int deleteReviewImg(int reviewCode) {
		// TODO Auto-generated method stub
		
		int result = reviewDAO.deleteReview(reviewCode);
		
		return result;
	}

}
