package org.ht.service.impl;

import java.util.List;
import java.util.Map;

import org.ht.dao.CreditlimitDao;
import org.ht.pojo.Creditlimit;
import org.ht.service.CreditlimitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CreditlimitServiceImpl implements CreditlimitService {

	@Autowired
	private CreditlimitDao creditlimitDao;

	@Override
	public List<Creditlimit> queryCreditlimits(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<Creditlimit> creditlimits = creditlimitDao.queryCreditlimits(map);
		return creditlimits;
	}

	@Override
	public int updateCreditlimit(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return creditlimitDao.updateCreditlimit(map);
	}

	@Override
	public int insertCreditlimit(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return creditlimitDao.insertCreditlimit(map);
	}

}
