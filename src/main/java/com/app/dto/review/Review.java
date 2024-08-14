package com.app.dto.review;

import java.util.List;

import lombok.Data;

@Data
public class Review {
	int reviewCode;	//리뷰코드
	String rsvtCode;	//예약코드
	int userCode;	//유저코드(유저 정보 불러오기 위함)
	int acmCode;	//업소코드(숙소 정보 불러오기 위함)
    int roomCode;	//객실코드(객실 정보 불러오기 위함)
    int rating;		//평점
    String reviewText;	//리뷰 텍스트
    String reviewDate;	//리뷰 작성 날짜(쿼리문에서 String으로 출력하게 할 예정)
    String replyExists;			//숙소 사장님 답글 여부
    
//신고 관련 컬럼 - mypage에서는 사용X
//    String reportStatus;	//신고 여부
//    String reportReason;	//신고 사유
    
    String acmName;	//숙소 이름
    
    String roomName;	//객실 이름
    
    List<ReviewImg> reviewImgList;	//리뷰이미지 리스트
}
