package com.app.dao.business.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.business.BusinessDAO;
import com.app.dto.admin.Accommodation;
import com.app.dto.business.Business;

@Repository
public class BusinessDAOImpl implements BusinessDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Business findBusinessByUserCode(int userCode) {
		return sqlSessionTemplate.selectOne("business_mapper.findBusinessByUserCode", userCode);
	}

	@Override
	public int saveAccommodation(Accommodation accm) {
		return sqlSessionTemplate.insert("business_mapper.saveAccommodation", accm);
	}

	@Override
	public List<Accommodation> findAccmListByUserCode(int userCode) {
		return sqlSessionTemplate.selectList("business_mapper.findAccmListByUserCode", userCode);
	}
}
