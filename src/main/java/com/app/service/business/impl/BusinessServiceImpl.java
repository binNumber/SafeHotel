package com.app.service.business.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.business.BusinessDAO;
import com.app.dto.business.Business;
import com.app.service.business.BusinessService;

@Service
public class BusinessServiceImpl implements BusinessService{

	@Autowired
	BusinessDAO businessDAO;

	@Override
	public Business findBusinessByUserCode(int userCode) {
		return businessDAO.findBusinessByUserCode(userCode);
	}

}
