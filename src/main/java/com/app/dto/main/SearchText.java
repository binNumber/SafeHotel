package com.app.dto.main;

import java.sql.Date;

import lombok.Data;

@Data
public class SearchText {
	
	String searchText;
	Date checkIn;
	Date checkOut;
	int people;
	
	  public SearchText(String searchText, Date checkIn, Date checkOut, int people) {
	        this.searchText = searchText;
	        this.checkIn = checkIn;
	        this.checkOut = checkOut;
	        this.people = people;
	    }

}
