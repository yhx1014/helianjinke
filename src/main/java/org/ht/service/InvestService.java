package org.ht.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.ht.pojo.InvestInfo;

public interface InvestService {
	public int investA(InvestInfo ii);
	public List<InvestInfo> investS(Map<String, Object> map);
	public Double sumMoney(Map<String, Object> map);
	
	public List<InvestInfo> getDtail(Map<String, InvestInfo> map);
	public Integer getMoney(Integer uid);
}
