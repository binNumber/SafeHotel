package com.app.dto.main;

import java.sql.Date;

import lombok.Data;

@Data
public class ReceiveData {

	String acmCode;
	String acmName;
	String acmAddr;
	String accImgUrl;
	String accImgSaveName;
	String accImgExtension;
	int minPrice;
	Date checkIn;
	
	public String getFullImageUrl() {
        return accImgUrl + "/" + accImgSaveName + accImgExtension;
    }

	public Date getCheckIn() {
		// TODO Auto-generated method stub
		return checkIn;
	}

}
