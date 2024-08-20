package com.app.dto.main;

import lombok.Data;

@Data
public class ReceiveData {

	String acmCode;
	String acmName;
	String acmAddr;
	String accImgUrl;
	String accImgSaveName;
	String accImgExtension;
	
	public String getFullImageUrl() {
        return accImgUrl + "/" + accImgSaveName + accImgExtension;
    }

}
