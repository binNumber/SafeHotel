package com.app.dto.business;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Accommodation {
	int acmCode;
	String acmType;
	String acmTypeName;
	String acmName;
	String bsnsCode;
	String acmTel;
	String acmAddr;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date acmRegDt;
	String acmStatus;
}
