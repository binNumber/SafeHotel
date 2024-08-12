package com.app.dao.business.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.business.BusinessDAO;
import com.app.dto.business.Business;

@Repository
public class BusinessDAOImpl implements BusinessDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Business findBusinessByUserCode(int userCode) {
		return sqlSessionTemplate.selectOne("business_mapper.findBusinessByUserCode", userCode);
	}
}
