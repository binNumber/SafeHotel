package com.app.dao.business;

import java.util.List;

import com.app.dto.admin.Accommodation;
import com.app.dto.business.Business;

public interface BusinessDAO {

	public Business findBusinessByUserCode(int userCode);

	public int saveAccommodation(Accommodation accm);

	public List<Accommodation> findAccmListByUserCode(int userCode);
	
}
