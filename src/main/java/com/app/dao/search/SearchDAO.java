package com.app.dao.search;

import java.util.List;

import com.app.dto.main.ReceiveData;

public interface SearchDAO {

	List<ReceiveData> searchAccommodations(String searchText);

}
