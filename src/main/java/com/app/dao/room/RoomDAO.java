package com.app.dao.room;

import java.util.List;

import com.app.dto.room.Room;
import com.app.dto.room.SearchRoomCondition;

public interface RoomDAO {
	
	//searchRoomCondition 기반으로 객실 리스트 불러오기
	public List<Room> findRoomListBySearchRoomCondtion(SearchRoomCondition searchRoom);
}
