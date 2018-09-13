package org.ht.dao;

import java.util.List;
import java.util.Map;

import org.ht.pojo.Borrowmoney;
import org.ht.pojo.Creditlimit;

public interface CreditlimitDao extends BaseDao<Object, Borrowmoney> {

	public List<Creditlimit> queryCreditlimits(Map<String, Object> map);
	
	public int insertCreditlimit(Map<String, Object> map);
	public int updateCreditlimit(Map<String, Object> map);

}
