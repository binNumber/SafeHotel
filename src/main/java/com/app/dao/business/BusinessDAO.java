package com.app.dao.business;

import com.app.dto.business.Business;

public interface BusinessDAO {

	public Business findBusinessByUserCode(int userCode);
	
}
