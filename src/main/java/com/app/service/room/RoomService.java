package com.app.service.room;

import java.util.List;

import com.app.dto.room.Room;
import com.app.dto.room.SearchRoomCondition;

public interface RoomService {
	
	//searchRoomCondition 기반으로 객실 리스트 불러오기
	public List<Room> findRoomListBySearchRoomCondtion(SearchRoomCondition searchRoom);

	//업소코드 기반으로 객실 리스트 불러오기
	public List<Room> findRoomListByAcmCode(int acmCode);
}
