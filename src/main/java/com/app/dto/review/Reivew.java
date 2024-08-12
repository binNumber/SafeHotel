package com.app.dto.review;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class Reivew {
	int reviewCode;	//리뷰코드
	int userCode;	//유저코드(유저 정보 불러오기 위함)
	int acmCode;	//업소코드(숙소 정보 불러오기 위함)
    int Room_code;	//객실코드(객실 정보 불러오기 위함)
    int rating;		//평점
    String reviewText;	//리뷰 텍스트
    String reviewDate;	//리뷰 작성 날짜(쿼리문에서 String으로 출력하게 할 예정)
    String replyExists;			//숙소 사장님 답글 여부
}
