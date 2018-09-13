package org.ht.dao;

import java.util.List;
import java.util.Map;

import org.ht.pojo.Recharge;




public interface RechargeDao {
	List<Recharge> selectrc(Map<String, Object> map);
	int selectcount(Map<String, Object> map);
	List<Recharge> selectall();
	int sumczmoneyre();
	int sumdzmoneyre();
}
