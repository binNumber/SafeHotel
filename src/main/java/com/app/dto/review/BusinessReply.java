package com.app.dto.review;

import lombok.Data;

@Data
public class BusinessReply {

	int replyCode;	//리플 코드
    int reviewCode;	//리뷰 코드
    int userCode;	//유저 코드
    String replyText;	//리플 내용
    String replyDate;	//작성날짜
    
}
