package com.app.dao.room.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.room.RoomDAO;
import com.app.dto.room.Room;
import com.app.dto.room.SearchRoomCondition;

@Repository
public class RoomDAOImpl implements RoomDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//searchRoomCondition 기반으로 객실 리스트 불러오기
	@Override
	public List<Room> findRoomListBySearchRoomCondtion(SearchRoomCondition searchRoom) {
		// TODO Auto-generated method stub
		
		List<Room> roomList = sqlSessionTemplate.selectList("room_mapper.findRoomListBySearchRoomCondtion", searchRoom);
		
		return roomList;
	}

}
