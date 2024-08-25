package com.app.dto.map;

import lombok.Data;

@Data
public class Address {
	//경찰서랑 병원 주소와 이름 정보만 받을 DTO

	String addr;	//주소
	String name;	//이름
}
