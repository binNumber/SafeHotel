package com.app.service.business;

import com.app.dto.business.Business;

public interface BusinessService {
	
	public Business findBusinessByUserCode(int userCode);

}
