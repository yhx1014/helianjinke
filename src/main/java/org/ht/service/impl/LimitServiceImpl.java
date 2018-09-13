package org.ht.service.impl;

import java.util.List;

import org.ht.dao.LimitDao;
import org.ht.pojo.Limi;
import org.ht.service.LimitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
@Transactional
public class LimitServiceImpl implements LimitService{
	
	@Autowired
	private LimitDao limitdao;
	
	public List limitByeid(int eid) {
		
		return limitdao.limitByeid(eid);
	}


	public boolean limitdel(Integer eid) {
		
		return limitdao.limitdel(eid);
	}

	public boolean limitadd(Limi limi) {
		
		return limitdao.limitadd(limi);
	}


}
