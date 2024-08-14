package com.app.service.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.review.ReviewDAO;
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

}
