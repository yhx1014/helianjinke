package org.ht.dao;

import java.util.List;
import java.util.Map;

import org.ht.pojo.Approveitem;
import org.ht.pojo.Bankcard;

public interface BankcardDao {
	List<Bankcard> selectbc(Map<String, Object> map);
	int bankcount(Map<String, Object> map);
}
