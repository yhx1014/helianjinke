package org.ht.service;

import java.util.List;
import java.util.Map;

import org.ht.pojo.Recharge;





public interface RechargeService {
	Map<String, Object> selectrc(String currpage,Map<String, Object> findmap);
	List<Recharge> selectall();
	int sumczmoneyre();
	int sumdzmoneyre();
}
