package com.app.service.room.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.room.RoomDAO;
import com.app.dto.room.Room;
import com.app.dto.room.SearchRoomCondition;
import com.app.service.room.RoomService;

@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	RoomDAO roomDAO;
	
	//searchRoomCondition 기반으로 객실 리스트 불러오기
	@Override
	public List<Room> findRoomListBySearchRoomCondtion(SearchRoomCondition searchRoom) {
		// TODO Auto-generated method stub
		
		List<Room> roomList = roomDAO.findRoomListBySearchRoomCondtion(searchRoom);
		
		return roomList;
	}

}
