package com.app.service.business.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.business.BusinessDAO;
import com.app.dto.admin.Accommodation;
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

	@Override
	public int saveAccommodation(Accommodation accm) {
		return businessDAO.saveAccommodation(accm);
	}

	@Override
	public List<Accommodation> findAccmListByUserCode(int userCode) {
		return businessDAO.findAccmListByUserCode(userCode);
	}
}
