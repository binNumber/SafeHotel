package com.app.dto.main;

import java.util.List;

import com.app.dto.room.Room;

import java.sql.Date;

import lombok.Data;

@Data
public class ReceiveData {

	String acmCode;
	
	int acmCodeInt;
	
	String acmName;
	String acmAddr;
	String accImgUrl;
	String accImgSaveName;
	String accImgExtension;
	int minPrice;
	Date checkIn;
	
	List<Room> roomList;
	int usageAmount;	//이용금액
	String usageAmountStr;
	
	public String getFullImageUrl() {
        return accImgUrl + "/" + accImgSaveName + accImgExtension;
    }

	public Date getCheckIn() {
		// TODO Auto-generated method stub
		return checkIn;
	}

}
