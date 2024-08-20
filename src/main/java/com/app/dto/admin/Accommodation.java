package com.app.dto.admin;

import java.sql.Date;

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
	Date acmRegDt;
	String acmStatus;
	int acm_reg_site;
}
