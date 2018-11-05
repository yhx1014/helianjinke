package org.ht.dao;

import org.springframework.stereotype.Repository;

import java.util.Map;

public interface BankcardDao {
	//List<Bankcard> selectbc(Map<String, Object> map);
	int bankcount(Map<String, Object> map);
}
