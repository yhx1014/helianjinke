package org.ht.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.ht.dao.CertificationDao;
import org.ht.pojo.Certification;
import org.ht.service.CertificationService;
import org.springframework.stereotype.Service;


@Service
public class CertificationServiceImpl implements CertificationService{

	@Resource
	CertificationDao cd;
	
	@Override
	public String selectM(Integer uid) {
		return cd.selMoney(uid);
	}

	@Override
	public boolean updateM(Map<String,Object> map) {
		return cd.updMoney(map);
	}

	@Override
	public int insert(Certification cer) {
		// TODO Auto-generated method stub
		return cd.insert(cer);
	}

	@Override
	public Certification select(Integer uid) {
		// TODO Auto-generated method stub
		return cd.select(uid);
	}

	@Override
	public boolean undate(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return cd.upmoney(map);
	}

	@Override
	public boolean upm(Map<String, Object> map) {
		return cd.upmoney(map);
	}

}
