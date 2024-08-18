package com.app.dao.review.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.review.ReviewDAO;
import com.app.dto.review.Review;
import com.app.dto.review.ReviewImg;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//유저코드 기반으로 리뷰 리스트 불러오기
	@Override
	public List<Review> findReviewListByUserCode(int userCode) {
		// TODO Auto-generated method stub
		
		List<Review> reviewList = sqlSessionTemplate.selectList("review_mapper.findReviewListByUserCode", userCode);
		
		return reviewList;
	}

	@Override
	public List<ReviewImg> findReviewImgListByReviewCode(int reviewCode) {
		// TODO Auto-generated method stub

		List<ReviewImg> rvImgList = sqlSessionTemplate.selectList("review_mapper.findReviewImgListByReviewCode", reviewCode);
		
		return rvImgList;
	}

	//예약코드 기반으로 이미지 리스트 불러오기
	@Override
	public List<ReviewImg> findReviewImgListByRsvtCode(String rsvtCode) {
		// TODO Auto-generated method stub
		
		List<ReviewImg> rvImgList = sqlSessionTemplate.selectList("review_mapper.findReviewImgListByRsvtCode", rsvtCode);
		
		return rvImgList;
	}

	//다음 리뷰 코드 불러오기(리뷰코드 생성)
	@Override
	public int getNextReviewCode() {
		// TODO Auto-generated method stub
		
		int reviewCode = sqlSessionTemplate.selectOne("review_mapper.getNextReviewCode");
		
		return reviewCode;
	}

	//다음 리뷰 이미지 코드 불러오기(리뷰 이미지 코드 생성)
	@Override
	public int getNextReviewImgCode() {
		// TODO Auto-generated method stub
		
		int reviewImgCode = sqlSessionTemplate.selectOne("review_mapper.getNextReviewImgCode");
		
		return reviewImgCode;
	}

	//유저 리뷰 DB에 저장
	@Override
	public int saveUserReview(Review review) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.insert("review_mapper.saveUserReview", review);
		
		return result;
	}

	//리뷰 이미지 DB에 저장
	@Override
	public int saveReviewImg(ReviewImg reviewImg) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.insert("review_mapper.saveReviewImg", reviewImg);
		
		return result;
	}

	//리뷰 삭제
	@Override
	public int deleteReview(int reviewCode) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.delete("review_mapper.deleteReview", reviewCode);
		
		return result;
	}

	//업소코드 기반으로 리뷰 리스트 불러오기
	@Override
	public List<Review> findReviewListByAcmCode(int acmCode) {
		// TODO Auto-generated method stub
		
		List<Review> reviewList = sqlSessionTemplate.selectList("review_mapper.findReviewListByAcmCode", acmCode);
		
		return reviewList;
	}
	
	

}
