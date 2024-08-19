package com.app.service.business;

import java.util.List;

import com.app.dto.admin.Accommodation;
import com.app.dto.business.Business;

public interface BusinessService {
	
	public Business findBusinessByUserCode(int userCode);

	public int saveAccommodation(Accommodation accm);

	public List<Accommodation> findAccmListByUserCode(int userCode);

}
