package com.app.dto.admin;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewReport {

	int reviewCode;
	int userCode;
	String reportReason;
	String reviewText;
	Date reviewDate;
}
