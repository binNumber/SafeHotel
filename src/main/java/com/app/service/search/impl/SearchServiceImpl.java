package com.app.service.search.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.search.SearchDAO;
import com.app.dto.main.ReceiveData;
import com.app.service.search.SearchService;

@Service
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	SearchDAO searchDAO;
	
	@Override
    public List<ReceiveData> searchAccommodations(String searchText) {
        return searchDAO.searchAccommodations(searchText);
    }


}
