package com.app.utiil;

import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import com.app.dto.room.Room;
import com.app.dto.room.SearchRoomCondition;

public class RoomAmountManager {
	
	public static String getRoomAmount(SearchRoomCondition condition, Room room) {
		
		String roomAmountStr = null;
		
		int roomAmount = determinePrice(condition, room);
		
		NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.KOREA);
		
		//room에 가격 String 타입 저장
		roomAmountStr = numberFormat.format(roomAmount);
		
		return roomAmountStr;
	}
	
	public static int determinePrice(SearchRoomCondition searchRoom, Room room) {
		
		//반환할 룸 금액
		int roomAmount = 0;
		
		//String 값을 Date로 치환
		Date date = getDateByString(searchRoom.getCheckInDate());
		int month = getMonth(date);
		int day = getDayOfWeek(date);
		
		if(day >= 1 && day <= 5) {//월~금(주중)
			roomAmount = room.getRoomWeekdayPrice();
			
			//성수기 금액이 있는 경우
			if(room.getPeakSeasonWeekdayPrice() != 0 || room.getPeakSeasonWeekendPrice() != 0) {
				if(month == 7 || month == 8) {
					roomAmount = room.getPeakSeasonWeekdayPrice();
				}
			}
			
		} else {//토~일(주말
			roomAmount = room.getRoomWeekendPrice();
			
			//성수기 금액이 있는 경우
			if(room.getPeakSeasonWeekdayPrice() != 0 || room.getPeakSeasonWeekendPrice() != 0) {
				if(month == 7 || month == 8) {
					roomAmount = room.getPeakSeasonWeekendPrice();
				}
			}
		}
	
		return roomAmount;
	}
	
	public static Date getDateByString (String dateStr) {
		
		Date date = null;
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		
		try {
			
			date = dateFormat.parse(dateStr);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return date;
	}
	
	public static int getMonth(Date date) {
		//달을 int값으로 치환 (1~12월)
		
		int month = 0;
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		month = calendar.get(calendar.MONTH) + 1;
		
		return month;
	}
	
	public static int getDayOfWeek(Date date) {
		//요일을 int 값으로 치환
		
		int day = 0;
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		day = calendar.get(calendar.DAY_OF_WEEK);
		
		return day;
	}

}
