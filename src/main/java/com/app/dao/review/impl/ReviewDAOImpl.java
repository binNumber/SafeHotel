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

}
