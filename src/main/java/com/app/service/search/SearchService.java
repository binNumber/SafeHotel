package com.app.service.search;

import java.util.List;

import com.app.dto.main.ReceiveData;

public interface SearchService {

	List<ReceiveData> searchAccommodations(String searchText);

}
