package org.ht.service.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.ht.dao.InvestInfoDao;
import org.ht.pojo.InvestInfo;
import org.ht.service.InvestService;
import org.springframework.stereotype.Service;

@Service
public class InvestServiceImpl implements InvestService {

	@Resource
	private InvestInfoDao iid;

	public int investA(InvestInfo ii) {

		return iid.create(ii);
	}

	public List<InvestInfo> investS(Map<String, Object> map) {

		return iid.recordList(map);
	}

	@Override
	public List<InvestInfo> getDtail(Map<String, InvestInfo> map) {
		// TODO Auto-generated method stub
		return iid.getDtail(map);
	}

	@Override
	public Double sumMoney(Map<String, Object> map) {
		return iid.getSum(map);
	}

	@Override
	public Integer getMoney(Integer uid) {
		return iid.getMoney(uid);
	}

}
