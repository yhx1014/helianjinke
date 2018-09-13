package org.ht.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.ht.pojo.InvestInfo;

public interface InvestInfoDao extends BaseDao<Object,InvestInfo>{
	public List<InvestInfo> recordList(Map<String, Object> map);
	Double getSum(Map<String, Object> map);
	List<InvestInfo> getDtail(@Param("params") Map<String, InvestInfo> params);
	Integer getMoney(Integer uid);
}
